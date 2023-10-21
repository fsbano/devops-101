# DevOps - 101
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/fsbano/become-devops/main/01-shellscript)"
```

# Getting WildFly v29.0.1 and just downloading it doesn't run the entire script
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/fsbano/become-devops/main/01-shellscript | bash -s /dev/null -v 29.0.1 -d )"
```
