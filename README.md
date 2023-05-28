# fish-pwgen

fish password generation function emurate to pwgen command (https://sourceforge.net/projects/pwgen/)

# Install

## Using fisher

```
fisher install holly/fish-pwgen
```

## Update

```
fisher update holly/fish-pwgen
```

# Usage

```
Usage:

  pwgen [option] [length] [number]

Options:

 -A        exclude uppercase alphabets
 -0        exclude numbers
 -y        include symbols
 -B        exclude similar words (0,1,2,9,l,q,z,I,O,Z)
```

# Example

## default

45 passwords of 12 characters are generated.

```
> pwgen
MD3lDGgtnFto    ICsoSS4nLO98    1y9VLnXrmzYu    BoCRjgkotM2V    aDcSPAB0MRnv    6m7PpVNACYsu    il7IM0gc3nOB    uxoIER6BUZSH
0tFW7nvICgD6    h9LveF3stjuR    GvpmJ2xxlIWS    yeHH7epOO7JK    HvE390xv9XY7    XPmsMw66W6w9    7X0zVCRhALrF    dAtgTU4K6soo
bL118t5Xfpj8    pLa0Br9Ee1yo    mvRosPp3H7Sg    g74BNpjs4rgv    R5kkjvee15id    c7x7ISpXVtf0    kWXuzf5059wW    vMxxbm5BGpBm
ww81Fkw5NWf6    S5N7c0eUSFGP    oMNdf4g46j8E    V0Ge3OkB30nF    KoTuhUB4ImVu    j099KGauXYEG    sykZZ9mODohn    1aabTsHOLt3J
NMr4Yftl80tB    g6WIs4jtIps3    3gVJ5JYFoWzi    NxDmxA4W7WCs    vFkD11vSMISX    cbB0930ZhvZ7    T8DT2W3EpAoS    4UTOrHnjkoVb
gdIj4zrmfzFY    eCrv1f28efJL    h9wE7l4HHUmF    Au6RcA3e0SLN    TDuTF5wXJsnI
```

## Exclude uppercase alphabets

add -A option

```
> pwgen -A
w7vzv1wvnwou    nz5uufd6wlbr    4e3ht7lsyvbj    dm5a915g48pc    svvegieaml1c    6jr9hcrf2vhk    v00nedfnt9we    tzsed73zf3ws
wdvgltw2k6kd    vsah5i4vshwt    yjjun1i67l36    01nlb53nu5v7    rdp0bhucm9o6    9u2mpfjc7a6x    22he07y04le1    zsegmb4muvud
t8a5chdowdwu    lfmz6mrt2glf    ltc9i6ga71j1    rd3p873kdlai    urh1ie6n3lts    7lju3grayr15    korm66ftep6k    vy754vj1bojr
s21jka99abig    lpt9prd8jl08    z213thp2ykas    5yuzu5arr902    87bgn2carvko    wy7r05507ojk    810pybrvfr28    onyfal55pta7
oxxnilj7trxh    et0l40cwbv47    9l0v3y3fka3p    zf5n2cnbur8n    9ibl85vmhekp    d2hxwxyv9v50    14chhxh5wpvt    oow8cv9ncxx5
9k5paosxap15    ffx4u038k7er    mukbdv8f8wsg    36h6mm9ursd1    m1a013goiur9
```

## Exclude numbers

add -0 option

```
> pwgen -0
mrZOfejYLTAC    pVZvdUUydAid    cavbHPMMnfmw    LOJUKbICPgit    NiSdYSKtWVPS    WeeyhYVPExzf    DlVeLAMrUcoT    AlrVfaglyXXE
dMBivetfEhch    aIPVzEbLvatE    dzYotxfbhegi    WkAkuyzHcklv    chItfbXPwbwV    emmZOBgpXcIe    TPCmLjKrtKEA    YAcwBbdEzyVx
tTHLSgPDDiPL    KihsCzNMryFW    FYNLdbobYTHB    LwXbbBlZKSCE    otRyMcTPeBOZ    FKrPLorHdoSP    eTGErnBsFUNO    CTbTgwxhaoSj
PmiEpfntLSxZ    UtpaBGfrSUiN    XRHUEKTISZjU    TJgTGSwLiILo    ongOoABalsvt    mfijuKNBTilI    oLSTcjUEltdl    vhoYRKeiIJdH
AKcJrTRpOTZH    rVEdfdfZKcFO    LNFiztstnKBr    hAeOijmMdAoP    WZwMBkdYaKLa    SuwwSSeaIBvu    ObvJabHZBcDL    zZpZoJXJEzzC
tdWWxOUsAbVF    uzobUVSYuLYk    JgtNeEbZvUoz    IWJJDkZXpOAw    brAmLUHFUWLx
```

## Include symbols

add -y option. 

```
> pwgen -y
wrA0F;lU>GP_    R4+/koEswD7u    HM0Wo++gho4;    A_uS_7NEE}^!    /R3I6w8n1720    !FB7fIAW;yDz    !0/ke4xtjxDu    zm{KG/8Z*dV^
NMlcJE3i}PU|    NrNk8uusr^00    /z^bw@dPuss6    $EK7TlwNAhj$    89m#Ww}icNv+    0ferUSeo#psX    7z655E*jG8hW    N^pbLm#4e_Nk
TVAgr1C4jgh.    lAv.I*;MKYh3    WR^tF4K|iRiF    ^nTXTFtXk<N6    %0%FFdpME!vf    SHBh<F#ag6vN    PEOySFKT98!o    00Ag*a}*c.hs
9ByS|wlbE3Y8    N9/DOUZkKoA$    30!hh9ehc|T;    t>;8NuxznX*+    ;6;2M|N^*s>L    >ORD*>js4+Hs    #oHed%!fF.1$    t.eEI1R.;u$%
ZKbh#y48wHJ*    1Jf#KNgleu>C    nk9.FS_X2%!>    taSb%1e8Z^4N    lmbS91u*85MT    1>>O.e8{RNrz    1B9f}AHaG}nk    M3kIH*gyp*b9
aj1dDm*<RS_I    <9^1e+zOoloB    Kp!u9P|pszV!    UgzG@nH<W6.b    IJ@ayUIL00ad
```


__pwgen_symbols variable set in conf.d/pwgen.fish is defined to contain the following values.

```
set -g __pwgen_symbols           '.+*^$@%_<>{}#!/;'
```

## Exclude similar words

add -B  option.

__pwgen_anbiguous_strings variable set in conf.d/pwgen.fish is defined to contain the following values.

```
set -g __pwgen_anbiguous_strings "0129lqzIOZ"
```

## change length and numbers

1 password of 12 characters is generated.

```
> pwgen 16 1
ZJuOMja85hoilI1S
```

4 passwords of 16 characters(include symbols and exclude anbiguous strings) are generated.

```
>pwgen -yB 16 4
3L#^D^;C^Kw>76^y        B.4V8h7b}N*k.n@i        b<2C%iH><$8W48^3        jSGSmp}t4VXXS+sY
```

# License

License is MIT.
