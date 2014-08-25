# encoding: utf-8

module Autostager
  # Convenience class to represent a PR in staging directory.
  class PullRequest
    attr_reader :name
    attr_reader :web_url
    attr_reader :number
    attr_reader :branch
    attr_reader :sha
    attr_reader :clone_url
    attr_reader :upstream_url
    attr_reader :base_dir

    include Autostager::Logger

    def initialize(branch, clone_url, base_dir, name, upstream)
      @branch = branch
      @clone_url = clone_url
      @base_dir = base_dir
      @name = name
      @upstream_url = upstream

      @staging_dir = File.join base_dir, @name
    end

    def local_sha
      Dir.chdir @staging_dir
      `git log --pretty='%H' HEAD^1..`.chomp
    end

    def staged?
      File.exist? @staging_dir
    end

    # How many commits is this branch behind?
    #
    # @param treeish [String] example: 'upstream/production'
    #
    # @return [Fixnum]
    def behind(treeish)
      Dir.chdir @staging_dir
      `git log --oneline ..#{treeish}`.lines.count
    end

    # A threshold for how many commits a branch can be behind upstream.
    #
    # @note This number is based on the value of same name in
    # spec/spec_helper.rb, so please update the value both
    # here and in spec_helper.rb if you need to change the threshold.
    #
    # @return [Fixnum]
    def behind_threshold
      10
    end

    # Is this branch within a reasonable number of commits with upstream?
    #
    # @param treeish [String] example: 'upstream/production'
    #
    # @return [Boolean]
    def up2date?(treeish)
      behind(treeish) <= behind_threshold
    end

    # Fast-forward this branch to origin.
    # @note This fails if the branch cannot be fast-forwarded.
    #
    # @return [Fixnum] exit status of `git rebase`
    # @return [nil] if `git rebase` fails to exit.
    def rebase
      log "rebase origin/#{@branch}"
      Dir.chdir @staging_dir
      `git rebase origin/#{@branch} &> /dev/null`
      status = $CHILD_STATUS.exitstatus
      update_submodules
      log "#{@branch} is at revision #{local_sha}"
      status
    end

    def reset_hard
      Dir.chdir @staging_dir
      `git reset --hard origin/#{@branch} &> /dev/null`
      update_submodules
    end

    def fetch
      log 'git fetch'
      Dir.chdir @staging_dir
      add_upstream_remote
      `git fetch --all --prune &> /dev/null`
    end

    def update_submodules
      log "update submodules in #{@staging_dir}"
      `git submodule sync &> /dev/null`
      `git submodule update --init --recursive &> /dev/null`
    end

    def remote?(s)
      Dir.chdir @staging_dir
      remotes = `git remote -v`.split("\n")
      urls = remotes.map { |r| r.split("\t").last.split(' ').first }.uniq
      urls.include?(s)
    end

    def add_upstream_remote
      Dir.chdir @staging_dir
      log 'add upstream remote'
      `git remote add upstream #{@upstream_url} &> /dev/null`
      `git fetch --prune upstream &> /dev/null`
    end

    def clone
      log "clone to #{@staging_dir}"
      FileUtils.mkdir_p @base_dir unless File.exist?(@base_dir)
      `git clone -b #{@branch} #{@clone_url} #{@staging_dir} &> /dev/null`
      Dir.chdir @staging_dir
      add_upstream_remote
      update_submodules
    end
  end
end
