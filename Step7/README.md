# Step7
## Building an Installer

1. InstallRequiredSystemLibraries 这个模块将包括当前平台项目所需要的任何运行时库

2. To build a binary distribution, from the Step7_build run:
```
cpack
```

3. To specify the generator, use the -G option:
```
cpack -G ZIP -C Debug
```

4. To create a source distribution:
```
cpack --config CPackSourceConfig.cmake
```

5. ps. Use  the following command to check the content
```
tar -tf Tutorial-1.0-Darwin.zip
```
