Contributing
============

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


Diff churn
----------

Please minimize diff churn to enhance git history commands.

* Arrays should usually be multi-line with trailing commas.

Update `.rubocop.yml` if necessary to favor minimal churn.


Linear history
--------------

Use `git rebase upstream/master` to update your branch.

* You **must** force-push after rebasing.
* We **never force-push** to master.

The primary reason for this is to maintain a clean, linear history
via "fast-forward" merges to master.
A clean, linear history in master makes it easier
to troubleshoot regressions and follow the timeline.
