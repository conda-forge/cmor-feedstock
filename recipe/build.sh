if [[ `uname` == "Linux" ]]; then
    export LDSHARED_FLAGS="-shared -pthread"
else
    export LDSHARED_FLAGS="-bundle -undefined dynamic_lookup"
fi

# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* .

autoconf

./configure \
    --with-python=${PREFIX}   \
    --with-uuid=${PREFIX} \
    --with-udunits2=${PREFIX} \
    --with-netcdf=${PREFIX} \
    --with-libjson-c=${PREFIX} \
    --prefix=${PREFIX}
make
make install
## END BUILD

