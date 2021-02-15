# Step4
## Installing and Testing

1. The default install path on Mac is /user/local/xxx
2. We can change the install path via --prefix argument
```
cd Step4_build
cmake ..
cmake --build .
cmake --install . --prefix "../installdir"
```
3. To run test
```
cd Step4_build
cmake ..
cmake -VV
or cmake -N
or cmake -C Debug -VV 
```
