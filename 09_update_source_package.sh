# Updating source package
```
$ zip -jr dqabot-src-pkg.zip sourcepkg/

$ fission package update --name dqabot-src-pkg-zip-8lwt --sourcearchive dqabot-src-pkg.zip --env pythonsrc --buildcmd "./build.sh"

$ fission fn test --name pushresult2testrail

```