cd internals 
doxygen Doxyfile 
cd ..
cd api 
doxygen Doxyfile 
cd ..
cd changelogs 
doxygen Doxyfile 
cd ..
cd patches 
doxygen Doxyfile 
cd ..
# Remove patch pages otherwise github-pages checks will fail.
rm patches/pages/*
