// Purpose: Converting PISA 2012 "parents" dataset from .txt to .dta

* All raw data from PISA 2012 is available at https://www.oecd.org/en/data/datasets/pisa-2012-database.html

* Unzipping the file and extract the .txt file to the temp directory
local zipfile "input/PISA2012/INT_PAQ12_DEC03.zip"

* Extracting the txt file
unzipfile `zipfile', replace

* Moving the extracted file to the temp directory
copy "INT_PAQ12_DEC03.txt" "cleaning/tempdata/INT_PAQ12_DEC03.txt", replace

* Defining the path to the extracted text file
local txtfile "cleaning/tempdata/INT_PAQ12_DEC03.txt"

* Deleting the file "INT_PAQ12_DEC03.txt" from the current directory
erase "INT_PAQ12_DEC03.txt" 

* Reading the fixed-width file using infix
infix ///
str3 CNT   1-  3 ///
str7 SUBNATIO   4- 10 ///
str7 STRATUM  11- 17 ///
OECD  18- 18 ///
str6 NC  19- 24 ///
str7 SCHOOLID  25- 31 ///
str5 STIDSTD  32- 36 ///
PA01Q01  37- 37 ///
PA01Q02  38- 38 ///
PA01Q03  39- 39 ///
PA02Q01  40- 40 ///
PA02Q02  41- 41 ///
PA03Q01  42- 42 ///
PA03Q02  43- 43 ///
PA03Q03  44- 44 ///
PA03Q04  45- 45 ///
PA05Q01  46- 46 ///
PA05Q02  47- 47 ///
PA05Q03  48- 48 ///
PA05Q04  49- 49 ///
PA07Q01  50- 50 ///
PA08Q01  51- 51 ///
PA09Q01  52- 52 ///
PA09Q02  53- 53 ///
PA09Q03  54- 54 ///
PA09Q04  55- 55 ///
PA09Q05  56- 56 ///
PA09Q06  57- 57 ///
PA09Q07  58- 58 ///
PA10Q01  59- 59 ///
PA10Q02  60- 60 ///
PA10Q03  61- 61 ///
PA10Q04  62- 62 ///
PA10Q05  63- 63 ///
PA10Q06  64- 64 ///
PA10Q07  65- 65 ///
PA10Q08  66- 66 ///
PA10Q09  67- 67 ///
PA10Q10  68- 68 ///
PA10Q11  69- 69 ///
PA11Q01  70- 70 ///
PA12Q01  71- 71 ///
PA12Q02  72- 72 ///
PA12Q03  73- 73 ///
PA12Q04  74- 74 ///
PA12Q05  75- 75 ///
PA12Q06  76- 76 ///
PA12Q07  77- 77 ///
PA12Q08  78- 78 ///
PA12Q09  79- 79 ///
PA12Q10  80- 80 ///
PA12Q11  81- 81 ///
PA13Q01  82- 82 ///
PA13Q02  83- 83 ///
PA13Q03  84- 84 ///
PA13Q04  85- 85 ///
PA13Q05  86- 86 ///
PA13Q06  87- 87 ///
PA13Q07  88- 88 ///
PA14Q01  89- 89 ///
PA14Q02  90- 90 ///
PA14Q03  91- 91 ///
PA14Q04  92- 92 ///
PA15Q01  93- 93 ///
PA15Q02  94- 94 ///
PA15Q03  95- 95 ///
PA15Q04  96- 96 ///
PA15Q05  97- 97 ///
PA18Q01  98- 98 ///
PA18Q02  99- 99 ///
PA18Q03 100-100 ///
PA19Q01 101-101 ///
PA19Q02 102-102 ///
PA19Q03 103-103 ///
PA19Q04 104-104 ///
PA19Q05 105-105 ///
PA19Q06 106-106 ///
PA21Q01 107-107 ///
PA21Q02 108-108 ///
PA21Q03 109-109 ///
PA21Q04 110-110 ///
PA21Q05 111-111 ///
PA21Q06 112-112 ///
str4 PA22Q01 113-116 ///
str4 PA23Q01 117-120 ///
str6 PA24N0101 121-126 ///
str6 PA24N0102 127-132 ///
str6 PA24N0103 133-138 ///
str6 PA24N0104 139-144 ///
str6 PA24N0105 145-150 ///
str6 PA24N0106 151-156 ///
str6 PA24N0107 157-162 ///
str6 PA24N0108 163-168 ///
str6 PA24N0109 169-174 ///
str6 PA24N0110 175-180 ///
str6 PA24N0111 181-186 ///
str6 PA24N0112 187-192 ///
str6 PA24N0113 193-198 ///
str6 PA24N0201 199-204 ///
str6 PA24N0202 205-210 ///
str6 PA24N0203 211-216 ///
str6 PA24N0204 217-222 ///
str6 PA24N0205 223-228 ///
str6 PA24N0206 229-234 ///
str6 PA24N0207 235-240 ///
str6 PA24N0208 241-246 ///
str6 PA24N0209 247-252 ///
str6 PA24N0210 253-258 ///
str6 PA24N0211 259-264 ///
str6 PA24N0212 265-270 ///
str6 PA24N0213 271-276 ///
PA25Q01 277-277 ///
PA25Q02 278-278 ///
str4 OCOD3 279-282 ///
str4 OCOD4 283-286 ///
str4 OCOD5 287-290 ///
PARINVOL 291-299 ///
PARSUPP 300-308 ///
PQBFMJ 309-313 ///
PQBMMJ 314-318 ///
PQCITIZF 319-319 ///
PQCITIZM 320-320 ///
str6 PQCOB_F 321-326 ///
str6 PQCOB_M 327-332 ///
str6 PQCOB_MGM 333-338 ///
str6 PQCOB_MGF 339-344 ///
str6 PQCOB_PGM 345-350 ///
str6 PQCOB_PGF 351-356 ///
PQEDASP 357-357 ///
PQFISCED 358-358 ///
PQHISCED 359-359 ///
PQHISEI 360-364 ///
PQIMMIGF 365-365 ///
PQIMMIGM 366-366 ///
str3 PQLANGNF 367-369 ///
str3 PQLANGNM 370-372 ///
PQMCAR 373-381 ///
PQMIMP 382-390 ///
PQMISCED 391-391 ///
PQOCCASP 392-396 ///
PQSCHOOL 397-405 ///
SENWGT_PAQ 406-414 ///
str7 VER_PAQ 415-421 ///
using `txtfile', clear


* Dealing with missing valuesreplace NC = "" if NC == "777777" | NC == "888888" | NC == "999997" | NC == "999998" | NC == "999999"
replace PA24N0103 = "" if PA24N0103 == "777777" | PA24N0103 == "888888" | PA24N0103 == "999997" | PA24N0103 == "999998" | PA24N0103 == "999999"
replace PA24N0104 = "" if PA24N0104 == "777777" | PA24N0104 == "888888" | PA24N0104 == "999997" | PA24N0104 == "999998" | PA24N0104 == "999999"
replace PA24N0105 = "" if PA24N0105 == "777777" | PA24N0105 == "888888" | PA24N0105 == "999997" | PA24N0105 == "999998" | PA24N0105 == "999999"
replace PA24N0106 = "" if PA24N0106 == "777777" | PA24N0106 == "888888" | PA24N0106 == "999997" | PA24N0106 == "999998" | PA24N0106 == "999999"
replace PA24N0107 = "" if PA24N0107 == "777777" | PA24N0107 == "888888" | PA24N0107 == "999997" | PA24N0107 == "999998" | PA24N0107 == "999999"
replace PA24N0108 = "" if PA24N0108 == "777777" | PA24N0108 == "888888" | PA24N0108 == "999997" | PA24N0108 == "999998" | PA24N0108 == "999999"
replace PA24N0109 = "" if PA24N0109 == "777777" | PA24N0109 == "888888" | PA24N0109 == "999997" | PA24N0109 == "999998" | PA24N0109 == "999999"
replace PA24N0110 = "" if PA24N0110 == "777777" | PA24N0110 == "888888" | PA24N0110 == "999997" | PA24N0110 == "999998" | PA24N0110 == "999999"
replace PA24N0111 = "" if PA24N0111 == "777777" | PA24N0111 == "888888" | PA24N0111 == "999997" | PA24N0111 == "999998" | PA24N0111 == "999999"
replace PA24N0112 = "" if PA24N0112 == "777777" | PA24N0112 == "888888" | PA24N0112 == "999997" | PA24N0112 == "999998" | PA24N0112 == "999999"
replace PA24N0113 = "" if PA24N0113 == "777777" | PA24N0113 == "888888" | PA24N0113 == "999997" | PA24N0113 == "999998" | PA24N0113 == "999999"
replace PA24N0201 = "" if PA24N0201 == "777777" | PA24N0201 == "888888" | PA24N0201 == "999997" | PA24N0201 == "999998" | PA24N0201 == "999999"
replace PA24N0202 = "" if PA24N0202 == "777777" | PA24N0202 == "888888" | PA24N0202 == "999997" | PA24N0202 == "999998" | PA24N0202 == "999999"
replace PA24N0203 = "" if PA24N0203 == "777777" | PA24N0203 == "888888" | PA24N0203 == "999997" | PA24N0203 == "999998" | PA24N0203 == "999999"
replace PA24N0204 = "" if PA24N0204 == "777777" | PA24N0204 == "888888" | PA24N0204 == "999997" | PA24N0204 == "999998" | PA24N0204 == "999999"
replace PA24N0205 = "" if PA24N0205 == "777777" | PA24N0205 == "888888" | PA24N0205 == "999997" | PA24N0205 == "999998" | PA24N0205 == "999999"
replace PA24N0206 = "" if PA24N0206 == "777777" | PA24N0206 == "888888" | PA24N0206 == "999997" | PA24N0206 == "999998" | PA24N0206 == "999999"
replace PA24N0207 = "" if PA24N0207 == "777777" | PA24N0207 == "888888" | PA24N0207 == "999997" | PA24N0207 == "999998" | PA24N0207 == "999999"
replace PA24N0208 = "" if PA24N0208 == "777777" | PA24N0208 == "888888" | PA24N0208 == "999997" | PA24N0208 == "999998" | PA24N0208 == "999999"
replace PA24N0209 = "" if PA24N0209 == "777777" | PA24N0209 == "888888" | PA24N0209 == "999997" | PA24N0209 == "999998" | PA24N0209 == "999999"
replace PA24N0210 = "" if PA24N0210 == "777777" | PA24N0210 == "888888" | PA24N0210 == "999997" | PA24N0210 == "999998" | PA24N0210 == "999999"
replace PA24N0211 = "" if PA24N0211 == "777777" | PA24N0211 == "888888" | PA24N0211 == "999997" | PA24N0211 == "999998" | PA24N0211 == "999999"
replace PA24N0212 = "" if PA24N0212 == "777777" | PA24N0212 == "888888" | PA24N0212 == "999997" | PA24N0212 == "999998" | PA24N0212 == "999999"
replace PA24N0213 = "" if PA24N0213 == "777777" | PA24N0213 == "888888" | PA24N0213 == "999997" | PA24N0213 == "999998" | PA24N0213 == "999999"
replace PQCOB_MGM = "" if PQCOB_MGM == "777777" | PQCOB_MGM == "888888" | PQCOB_MGM == "999997" | PQCOB_MGM == "999998" | PQCOB_MGM == "999999"
replace PA24N0101 = "" if PA24N0101 == "777777" | PA24N0101 == "888888" | PA24N0101 == "999997" | PA24N0101 == "999998" | PA24N0101 == "999999"
replace PA24N0102 = "" if PA24N0102 == "777777" | PA24N0102 == "888888" | PA24N0102 == "999997" | PA24N0102 == "999998" | PA24N0102 == "999999"
replace PQCOB_PGF = "" if PQCOB_PGF == "777777" | PQCOB_PGF == "888888" | PQCOB_PGF == "999997" | PQCOB_PGF == "999998" | PQCOB_PGF == "999999"
replace PQCOB_M = "" if PQCOB_M == "777777" | PQCOB_M == "888888" | PQCOB_M == "999997" | PQCOB_M == "999998" | PQCOB_M == "999999"
replace PQCOB_F = "" if PQCOB_F == "777777" | PQCOB_F == "888888" | PQCOB_F == "999997" | PQCOB_F == "999998" | PQCOB_F == "999999"
replace PQCOB_PGM = "" if PQCOB_PGM == "777777" | PQCOB_PGM == "888888" | PQCOB_PGM == "999997" | PQCOB_PGM == "999998" | PQCOB_PGM == "999999"
replace PQCOB_MGF = "" if PQCOB_MGF == "777777" | PQCOB_MGF == "888888" | PQCOB_MGF == "999997" | PQCOB_MGF == "999998" | PQCOB_MGF == "999999"
replace OCOD5 = "" if OCOD5 == "9997" | OCOD5 == "9998" | OCOD5 == "9999"
replace OCOD3 = "" if OCOD3 == "9997" | OCOD3 == "9998" | OCOD3 == "9999"
replace OCOD4 = "" if OCOD4 == "9997" | OCOD4 == "9998" | OCOD4 == "9999"
replace PA22Q01 = "" if PA22Q01 == "9997" | PA22Q01 == "9998" | PA22Q01 == "9999"
replace PA23Q01 = "" if PA23Q01 == "9997" | PA23Q01 == "9998" | PA23Q01 == "9999"
replace SENWGT_PAQ = . if SENWGT_PAQ == 9997 | SENWGT_PAQ == 9998 | SENWGT_PAQ == 9999
replace PA01Q01 = . if PA01Q01 == 7 | PA01Q01 == 8 | PA01Q01 == 9
replace PA01Q02 = . if PA01Q02 == 7 | PA01Q02 == 8 | PA01Q02 == 9
replace PA01Q03 = . if PA01Q03 == 7 | PA01Q03 == 8 | PA01Q03 == 9
replace PA02Q01 = . if PA02Q01 == 7 | PA02Q01 == 8 | PA02Q01 == 9
replace PA02Q02 = . if PA02Q02 == 7 | PA02Q02 == 8 | PA02Q02 == 9
replace PA03Q01 = . if PA03Q01 == 7 | PA03Q01 == 8 | PA03Q01 == 9
replace PA03Q02 = . if PA03Q02 == 7 | PA03Q02 == 8 | PA03Q02 == 9
replace PA03Q03 = . if PA03Q03 == 7 | PA03Q03 == 8 | PA03Q03 == 9
replace PA03Q04 = . if PA03Q04 == 7 | PA03Q04 == 8 | PA03Q04 == 9
replace PA05Q01 = . if PA05Q01 == 7 | PA05Q01 == 8 | PA05Q01 == 9
replace PA05Q02 = . if PA05Q02 == 7 | PA05Q02 == 8 | PA05Q02 == 9
replace PA05Q03 = . if PA05Q03 == 7 | PA05Q03 == 8 | PA05Q03 == 9
replace PA05Q04 = . if PA05Q04 == 7 | PA05Q04 == 8 | PA05Q04 == 9
replace PA07Q01 = . if PA07Q01 == 7 | PA07Q01 == 8 | PA07Q01 == 9
replace PA08Q01 = . if PA08Q01 == 7 | PA08Q01 == 8 | PA08Q01 == 9
replace PA09Q01 = . if PA09Q01 == 7 | PA09Q01 == 8 | PA09Q01 == 9
replace PA09Q02 = . if PA09Q02 == 7 | PA09Q02 == 8 | PA09Q02 == 9
replace PA09Q03 = . if PA09Q03 == 7 | PA09Q03 == 8 | PA09Q03 == 9
replace PA09Q04 = . if PA09Q04 == 7 | PA09Q04 == 8 | PA09Q04 == 9
replace PA09Q05 = . if PA09Q05 == 7 | PA09Q05 == 8 | PA09Q05 == 9
replace PA09Q06 = . if PA09Q06 == 7 | PA09Q06 == 8 | PA09Q06 == 9
replace PA09Q07 = . if PA09Q07 == 7 | PA09Q07 == 8 | PA09Q07 == 9
replace PA10Q01 = . if PA10Q01 == 7 | PA10Q01 == 8 | PA10Q01 == 9
replace PA10Q02 = . if PA10Q02 == 7 | PA10Q02 == 8 | PA10Q02 == 9
replace PA10Q03 = . if PA10Q03 == 7 | PA10Q03 == 8 | PA10Q03 == 9
replace PA10Q04 = . if PA10Q04 == 7 | PA10Q04 == 8 | PA10Q04 == 9
replace PA10Q05 = . if PA10Q05 == 7 | PA10Q05 == 8 | PA10Q05 == 9
replace PA10Q06 = . if PA10Q06 == 7 | PA10Q06 == 8 | PA10Q06 == 9
replace PA10Q07 = . if PA10Q07 == 7 | PA10Q07 == 8 | PA10Q07 == 9
replace PA10Q08 = . if PA10Q08 == 7 | PA10Q08 == 8 | PA10Q08 == 9
replace PA10Q09 = . if PA10Q09 == 7 | PA10Q09 == 8 | PA10Q09 == 9
replace PA10Q10 = . if PA10Q10 == 7 | PA10Q10 == 8 | PA10Q10 == 9
replace PA10Q11 = . if PA10Q11 == 7 | PA10Q11 == 8 | PA10Q11 == 9
replace PA11Q01 = . if PA11Q01 == 7 | PA11Q01 == 8 | PA11Q01 == 9
replace PA12Q01 = . if PA12Q01 == 7 | PA12Q01 == 8 | PA12Q01 == 9
replace PA12Q02 = . if PA12Q02 == 7 | PA12Q02 == 8 | PA12Q02 == 9
replace PA12Q03 = . if PA12Q03 == 7 | PA12Q03 == 8 | PA12Q03 == 9
replace PA12Q04 = . if PA12Q04 == 7 | PA12Q04 == 8 | PA12Q04 == 9
replace PA12Q05 = . if PA12Q05 == 7 | PA12Q05 == 8 | PA12Q05 == 9
replace PA12Q06 = . if PA12Q06 == 7 | PA12Q06 == 8 | PA12Q06 == 9
replace PA12Q07 = . if PA12Q07 == 7 | PA12Q07 == 8 | PA12Q07 == 9
replace PA12Q08 = . if PA12Q08 == 7 | PA12Q08 == 8 | PA12Q08 == 9
replace PA12Q09 = . if PA12Q09 == 7 | PA12Q09 == 8 | PA12Q09 == 9
replace PA12Q10 = . if PA12Q10 == 7 | PA12Q10 == 8 | PA12Q10 == 9
replace PA12Q11 = . if PA12Q11 == 7 | PA12Q11 == 8 | PA12Q11 == 9
replace PA13Q01 = . if PA13Q01 == 7 | PA13Q01 == 8 | PA13Q01 == 9
replace PA13Q02 = . if PA13Q02 == 7 | PA13Q02 == 8 | PA13Q02 == 9
replace PA13Q03 = . if PA13Q03 == 7 | PA13Q03 == 8 | PA13Q03 == 9
replace PA13Q04 = . if PA13Q04 == 7 | PA13Q04 == 8 | PA13Q04 == 9
replace PA13Q05 = . if PA13Q05 == 7 | PA13Q05 == 8 | PA13Q05 == 9
replace PA13Q06 = . if PA13Q06 == 7 | PA13Q06 == 8 | PA13Q06 == 9
replace PA13Q07 = . if PA13Q07 == 7 | PA13Q07 == 8 | PA13Q07 == 9
replace PA14Q01 = . if PA14Q01 == 7 | PA14Q01 == 8 | PA14Q01 == 9
replace PA14Q02 = . if PA14Q02 == 7 | PA14Q02 == 8 | PA14Q02 == 9
replace PA14Q03 = . if PA14Q03 == 7 | PA14Q03 == 8 | PA14Q03 == 9
replace PA14Q04 = . if PA14Q04 == 7 | PA14Q04 == 8 | PA14Q04 == 9
replace PA15Q01 = . if PA15Q01 == 7 | PA15Q01 == 8 | PA15Q01 == 9
replace PA15Q02 = . if PA15Q02 == 7 | PA15Q02 == 8 | PA15Q02 == 9
replace PA15Q03 = . if PA15Q03 == 7 | PA15Q03 == 8 | PA15Q03 == 9
replace PA15Q04 = . if PA15Q04 == 7 | PA15Q04 == 8 | PA15Q04 == 9
replace PA15Q05 = . if PA15Q05 == 7 | PA15Q05 == 8 | PA15Q05 == 9
replace PA18Q01 = . if PA18Q01 == 7 | PA18Q01 == 8 | PA18Q01 == 9
replace PA18Q02 = . if PA18Q02 == 7 | PA18Q02 == 8 | PA18Q02 == 9
replace PA18Q03 = . if PA18Q03 == 7 | PA18Q03 == 8 | PA18Q03 == 9
replace PA19Q01 = . if PA19Q01 == 7 | PA19Q01 == 8 | PA19Q01 == 9
replace PA19Q02 = . if PA19Q02 == 7 | PA19Q02 == 8 | PA19Q02 == 9
replace PA19Q03 = . if PA19Q03 == 7 | PA19Q03 == 8 | PA19Q03 == 9
replace PA19Q04 = . if PA19Q04 == 7 | PA19Q04 == 8 | PA19Q04 == 9
replace PA19Q05 = . if PA19Q05 == 7 | PA19Q05 == 8 | PA19Q05 == 9
replace PA19Q06 = . if PA19Q06 == 7 | PA19Q06 == 8 | PA19Q06 == 9
replace PA21Q01 = . if PA21Q01 == 7 | PA21Q01 == 8 | PA21Q01 == 9
replace PA21Q02 = . if PA21Q02 == 7 | PA21Q02 == 8 | PA21Q02 == 9
replace PA21Q03 = . if PA21Q03 == 7 | PA21Q03 == 8 | PA21Q03 == 9
replace PA21Q04 = . if PA21Q04 == 7 | PA21Q04 == 8 | PA21Q04 == 9
replace PA21Q05 = . if PA21Q05 == 7 | PA21Q05 == 8 | PA21Q05 == 9
replace PA21Q06 = . if PA21Q06 == 7 | PA21Q06 == 8 | PA21Q06 == 9
replace PA25Q01 = . if PA25Q01 == 7 | PA25Q01 == 8 | PA25Q01 == 9
replace PA25Q02 = . if PA25Q02 == 7 | PA25Q02 == 8 | PA25Q02 == 9
replace PARINVOL = . if PARINVOL == 9997 | PARINVOL == 9998 | PARINVOL == 9999
replace PARSUPP = . if PARSUPP == 9997 | PARSUPP == 9998 | PARSUPP == 9999
replace PQBFMJ = . if PQBFMJ == 96 | PQBFMJ == 97 | PQBFMJ == 98 | PQBFMJ == 99
replace PQBMMJ = . if PQBMMJ == 96 | PQBMMJ == 97 | PQBMMJ == 98 | PQBMMJ == 99
replace PQCITIZF = . if PQCITIZF == 7 | PQCITIZF == 8 | PQCITIZF == 9
replace PQCITIZM = . if PQCITIZM == 7 | PQCITIZM == 8 | PQCITIZM == 9
replace PQEDASP = . if PQEDASP == 7 | PQEDASP == 8 | PQEDASP == 9
replace PQFISCED = . if PQFISCED == 7 | PQFISCED == 8 | PQFISCED == 9
replace PQHISCED = . if PQHISCED == 7 | PQHISCED == 8 | PQHISCED == 9
replace PQHISEI = . if PQHISEI == 96 | PQHISEI == 97 | PQHISEI == 98 | PQHISEI == 99
replace PQIMMIGF = . if PQIMMIGF == 7 | PQIMMIGF == 8 | PQIMMIGF == 9
replace PQIMMIGM = . if PQIMMIGM == 7 | PQIMMIGM == 8 | PQIMMIGM == 9
replace PQMCAR = . if PQMCAR == 9997 | PQMCAR == 9998 | PQMCAR == 9999
replace PQMIMP = . if PQMIMP == 9997 | PQMIMP == 9998 | PQMIMP == 9999
replace PQMISCED = . if PQMISCED == 7 | PQMISCED == 8 | PQMISCED == 9
replace PQOCCASP = . if PQOCCASP == 96 | PQOCCASP == 97 | PQOCCASP == 98 | PQOCCASP == 99
replace PQSCHOOL = . if PQSCHOOL == 9997 | PQSCHOOL == 9998 | PQSCHOOL == 9999


* Including variable labels 
label variable NC "National Centre 6-digit Code"
label variable CNT "Country code 3-character"
label variable OECD "OECD country"
label variable SUBNATIO "Adjudicated sub-region code 7-digit code (3-digit country code + region ID + stratum ID)"
label variable STRATUM "Stratum ID 7-character (cnt + region ID + original stratum ID)"
label variable SCHOOLID "School ID 7-digit (region ID + stratum ID + 3-digit school ID)"
label variable STIDSTD "Student ID"
label variable PA01Q01 "Completed Quest  -  Mother"
label variable PA01Q02 "Completed Quest  -  Father"
label variable PA01Q03 "Completed Quest  -  Other"
label variable PA02Q01 "Parent Age - Father"
label variable PA02Q02 "Parent Age - Mother"
label variable PA03Q01 "Father Qualification - <ISCED level 5A, 6>"
label variable PA03Q02 "Father Qualification - <ISCED level 5B>"
label variable PA03Q03 "Father Qualification - <ISCED level 4>"
label variable PA03Q04 "Father Qualification - <ISCED level 3A>"
label variable PA05Q01 "Mother Qualification - <ISCED level 5A, 6>"
label variable PA05Q02 "Mother Qualification - <ISCED level 5B>"
label variable PA05Q03 "Mother Qualification - <ISCED level 4>"
label variable PA05Q04 "Mother Qualification - <ISCED level 3A>"
label variable PA07Q01 "Annual Household Income"
label variable PA08Q01 "Education Cost"
label variable PA09Q01 "School  -  Teach Competent"
label variable PA09Q02 "School  -  Achieve High"
label variable PA09Q03 "School  -  Content Good"
label variable PA09Q04 "School  -  Discipline Good"
label variable PA09Q05 "School  -  Progress Monitored"
label variable PA09Q06 "School  -  Progress Information"
label variable PA09Q07 "School  -  Education Good"
label variable PA10Q01 "Activities - Discuss behaviour own initiative"
label variable PA10Q02 "Activities - Discuss behaviour teacher"
label variable PA10Q03 "Activities - Volunteer maintenance"
label variable PA10Q04 "Activities - Volunteer clubs"
label variable PA10Q05 "Activities - Volunteer library"
label variable PA10Q06 "Activities - Assist teacher"
label variable PA10Q07 "Activities - Guest speaker"
label variable PA10Q08 "Activities - School government"
label variable PA10Q09 "Activities - Discuss progress own initiative"
label variable PA10Q10 "Activities - Discuss progress teacher"
label variable PA10Q11 "Activities - Volunteer in school canteen"
label variable PA11Q01 "Available Schooling"
label variable PA12Q01 "School Selection - Short distance"
label variable PA12Q02 "School Selection - Good reputation"
label variable PA12Q03 "School Selection - Course availability"
label variable PA12Q04 "School Selection - Particular philosophy"
label variable PA12Q05 "School Selection - Teaching approach"
label variable PA12Q06 "School Selection - Other family members"
label variable PA12Q07 "School Selection - Low expenses"
label variable PA12Q08 "School Selection - Financial aid"
label variable PA12Q09 "School Selection - Pleasant environment"
label variable PA12Q10 "School Selection - High achievements"
label variable PA12Q11 "School Selection - Safe environment"
label variable PA13Q01 "With Child  - Wellbeing at school"
label variable PA13Q02 "With Child  - Eat main meal"
label variable PA13Q03 "With Child  - Time talking"
label variable PA13Q04 "With Child  - Homework help"
label variable PA13Q05 "With Child  - Performance math"
label variable PA13Q06 "With Child  - Math materials"
label variable PA13Q07 "With Child  - Applying math"
label variable PA14Q01 "Math Skills Importance - Get good jobs"
label variable PA14Q02 "Math Skills Importance - Employer appreciation"
label variable PA14Q03 "Math Skills Importance - Job requirement"
label variable PA14Q04 "Math Skills Importance - Advantage in job market"
label variable PA15Q01 "Math Career - In family"
label variable PA15Q02 "Math Career - Child interest"
label variable PA15Q03 "Math Career - Child expectation"
label variable PA15Q04 "Math Career - Child study interest"
label variable PA15Q05 "Math Career - Child study expectation"
label variable PA18Q01 "Repeat Grade - At < ISCED 1>"
label variable PA18Q02 "Repeat Grade - At < ISCED 2>"
label variable PA18Q03 "Repeat Grade - At < ISCED 3>"
label variable PA19Q01 "Expected completed levels - <ISCED level 2>  "
label variable PA19Q02 "Expected completed levels - <ISCED level 3B or C>  "
label variable PA19Q03 "Expected completed levels - <ISCED level 3A>  "
label variable PA19Q04 "Expected completed levels - <ISCED level 4>  "
label variable PA19Q05 "Expected completed levels - <ISCED level 5B>  "
label variable PA19Q06 "Expected completed levels - <ISCED level 5A or 6>  "
label variable PA21Q01 "Family Country of Birth - Mother"
label variable PA21Q02 "Family Country of Birth - Father"
label variable PA21Q03 "Family Country of Birth - Maternal Grandmother"
label variable PA21Q04 "Family Country of Birth - Maternal Grandfather"
label variable PA21Q05 "Family Country of Birth - Paternal Grandmother"
label variable PA21Q06 "Family Country of Birth - Paternal Grandfather"
label variable PA22Q01 "Father Age Arrival Test Country"
label variable PA23Q01 "Mother Age Arrival Test Country"
label variable PA24N0101 "Country of Citizenship - Mother"
label variable PA24N0102 "Country of Citizenship - Mother"
label variable PA24N0103 "Country of Citizenship - Mother"
label variable PA24N0104 "Country of Citizenship - Mother"
label variable PA24N0105 "Country of Citizenship - Mother"
label variable PA24N0106 "Country of Citizenship - Mother"
label variable PA24N0107 "Country of Citizenship - Mother"
label variable PA24N0108 "Country of Citizenship - Mother"
label variable PA24N0109 "Country of Citizenship - Mother"
label variable PA24N0110 "Country of Citizenship - Mother"
label variable PA24N0111 "Country of Citizenship - Mother"
label variable PA24N0112 "Country of Citizenship - Mother"
label variable PA24N0113 "Country of Citizenship - Mother"
label variable PA24N0201 "Country of Citizenship - Father"
label variable PA24N0202 "Country of Citizenship - Father"
label variable PA24N0203 "Country of Citizenship - Father"
label variable PA24N0204 "Country of Citizenship - Father"
label variable PA24N0205 "Country of Citizenship - Father"
label variable PA24N0206 "Country of Citizenship - Father"
label variable PA24N0207 "Country of Citizenship - Father"
label variable PA24N0208 "Country of Citizenship - Father"
label variable PA24N0209 "Country of Citizenship - Father"
label variable PA24N0210 "Country of Citizenship - Father"
label variable PA24N0211 "Country of Citizenship - Father"
label variable PA24N0212 "Country of Citizenship - Father"
label variable PA24N0213 "Country of Citizenship - Father"
label variable PA25Q01 "Language Spoken at Home - Mother"
label variable PA25Q02 "Language Spoken at Home - Father"
label variable OCOD3 "Parental report on mother's ISCO08 classification"
label variable OCOD4 "Parental report on father's ISCO08 classification"
label variable OCOD5 "Parental report on career expectations for their children expressed in ISCO08"
label variable PARINVOL "Parental involvement in their child's school"
label variable PARSUPP "Student support"
label variable PQMIMP "Parent attitudes toward mathematics"
label variable PQBFMJ "Father ISEI from Parent Questionnaire"
label variable PQBMMJ "Mother ISEI from Parent Questionnaire"
label variable PQCITIZF "Parental citizenship - Father"
label variable PQCITIZM "Parental citizenship - Mother"
label variable PQCOB_F "Country of Birth - Father"
label variable PQCOB_M "Country of Birth - Mother"
label variable PQCOB_MGM "Country of Birth - Maternal Grand-Mother"
label variable PQCOB_MGF "Country of Birth - Maternal Grand-Father"
label variable PQCOB_PGM "Country of Birth - Paternal Grand-Mother"
label variable PQCOB_PGF "Country of Birth - Paternal Grand-Father"
label variable PQEDASP "Expected completed levels of education"
label variable PQLANGNF "Language at home (3-digit code) - Father"
label variable PQLANGNM "Language at home (3-digit code) - Mother"
label variable PQMISCED "PQ Educational level of mother (ISCED)"
label variable PQFISCED "PQ Educational level of father (ISCED)"
label variable PQHISCED "PQ Highest educational level of parents (ISCED)"
label variable PQHISEI "PQ Highest Parental Occupation Status (ISEI)"
label variable PQIMMIGF "Parental place of birth - Father"
label variable PQIMMIGM "Parental place of birth - Mother"
label variable PQMCAR "Mathematics Career"
label variable PQOCCASP "Expected ISEI of student from Parent Questionnaire"
label variable PQSCHOOL "Parents perception of school quality"
label variable SENWGT_PAQ "Senate weight - sum of weight within the country is 1000"
label variable VER_PAQ "Date of the database creation"


* Including value labels 
label define PA01Q01F 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values PA01Q01 PA01Q01F

label define PA01Q02F 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values PA01Q02 PA01Q02F

label define PA01Q03F 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values PA01Q03 PA01Q03F

label define PA02Q01F 1 "Younger than 36 years" 2 "36 – 40 years" 3 "41 – 45 years" 4 "46 – 50 years" 5 "51 years or older" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA02Q01 PA02Q01F

label define PA02Q02F 1 "Younger than 36 years" 2 "36 – 40 years" 3 "41 – 45 years" 4 "46 – 50 years" 5 "51 years or older" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA02Q02 PA02Q02F

label define PA03Q01F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA03Q01 PA03Q01F

label define PA03Q02F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA03Q02 PA03Q02F

label define PA03Q03F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA03Q03 PA03Q03F

label define PA03Q04F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA03Q04 PA03Q04F

label define PA05Q01F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA05Q01 PA05Q01F

label define PA05Q02F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA05Q02 PA05Q02F

label define PA05Q03F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA05Q03 PA05Q03F

label define PA05Q04F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA05Q04 PA05Q04F

label define PA07Q01F 1 "Less than <$A>" 2 "<$A> or more but less than <$B>" 3 "<$B> or more but less than <$C>" 4 "<$C> or more but less than <$D>" 5 "<$D> or more but less than <$E>" 6 "<$E> or more" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA07Q01 PA07Q01F

label define PA08Q01F 1 "Nothing" 2 "<More than $0 but less than $W>" 3 "<$W or more but less than $X>" 4 "<$X or more but less than $Y>" 5 "<$Y or more but less than $Z>" 6 "<$Z> or more" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA08Q01 PA08Q01F

label define PA09Q01F 1 "Strongly agree" 2 "Agree" 3 "Disagree" 4 "Strongly disagree" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA09Q01 PA09Q01F

label define PA09Q02F 1 "Strongly agree" 2 "Agree" 3 "Disagree" 4 "Strongly disagree" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA09Q02 PA09Q02F

label define PA09Q03F 1 "Strongly agree" 2 "Agree" 3 "Disagree" 4 "Strongly disagree" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA09Q03 PA09Q03F

label define PA09Q04F 1 "Strongly agree" 2 "Agree" 3 "Disagree" 4 "Strongly disagree" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA09Q04 PA09Q04F

label define PA09Q05F 1 "Strongly agree" 2 "Agree" 3 "Disagree" 4 "Strongly disagree" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA09Q05 PA09Q05F

label define PA09Q06F 1 "Strongly agree" 2 "Agree" 3 "Disagree" 4 "Strongly disagree" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA09Q06 PA09Q06F

label define PA09Q07F 1 "Strongly agree" 2 "Agree" 3 "Disagree" 4 "Strongly disagree" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA09Q07 PA09Q07F

label define PA10Q01F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA10Q01 PA10Q01F

label define PA10Q02F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA10Q02 PA10Q02F

label define PA10Q03F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA10Q03 PA10Q03F

label define PA10Q04F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA10Q04 PA10Q04F

label define PA10Q05F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA10Q05 PA10Q05F

label define PA10Q06F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA10Q06 PA10Q06F

label define PA10Q07F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA10Q07 PA10Q07F

label define PA10Q08F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA10Q08 PA10Q08F

label define PA10Q09F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA10Q09 PA10Q09F

label define PA10Q10F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA10Q10 PA10Q10F

label define PA10Q11F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA10Q11 PA10Q11F

label define PA11Q01F 1 "Two or more" 2 "One other" 3 "No others" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA11Q01 PA11Q01F

label define PA12Q01F 1 "Not important" 2 "Somewhat important" 3 "Important" 4 "Very important" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA12Q01 PA12Q01F

label define PA12Q02F 1 "Not important" 2 "Somewhat important" 3 "Important" 4 "Very important" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA12Q02 PA12Q02F

label define PA12Q03F 1 "Not important" 2 "Somewhat important" 3 "Important" 4 "Very important" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA12Q03 PA12Q03F

label define PA12Q04F 1 "Not important" 2 "Somewhat important" 3 "Important" 4 "Very important" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA12Q04 PA12Q04F

label define PA12Q05F 1 "Not important" 2 "Somewhat important" 3 "Important" 4 "Very important" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA12Q05 PA12Q05F

label define PA12Q06F 1 "Not important" 2 "Somewhat important" 3 "Important" 4 "Very important" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA12Q06 PA12Q06F

label define PA12Q07F 1 "Not important" 2 "Somewhat important" 3 "Important" 4 "Very important" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA12Q07 PA12Q07F

label define PA12Q08F 1 "Not important" 2 "Somewhat important" 3 "Important" 4 "Very important" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA12Q08 PA12Q08F

label define PA12Q09F 1 "Not important" 2 "Somewhat important" 3 "Important" 4 "Very important" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA12Q09 PA12Q09F

label define PA12Q10F 1 "Not important" 2 "Somewhat important" 3 "Important" 4 "Very important" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA12Q10 PA12Q10F

label define PA12Q11F 1 "Not important" 2 "Somewhat important" 3 "Important" 4 "Very important" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA12Q11 PA12Q11F

label define PA13Q01F 1 "Never or hardly ever" 2 "Once or twice a year" 3 "Once or twice a month" 4 "Once or twice a week" 5 "Every day or almost every day" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA13Q01 PA13Q01F

label define PA13Q02F 1 "Never or hardly ever" 2 "Once or twice a year" 3 "Once or twice a month" 4 "Once or twice a week" 5 "Every day or almost every day" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA13Q02 PA13Q02F

label define PA13Q03F 1 "Never or hardly ever" 2 "Once or twice a year" 3 "Once or twice a month" 4 "Once or twice a week" 5 "Every day or almost every day" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA13Q03 PA13Q03F

label define PA13Q04F 1 "Never or hardly ever" 2 "Once or twice a year" 3 "Once or twice a month" 4 "Once or twice a week" 5 "Every day or almost every day" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA13Q04 PA13Q04F

label define PA13Q05F 1 "Never or hardly ever" 2 "Once or twice a year" 3 "Once or twice a month" 4 "Once or twice a week" 5 "Every day or almost every day" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA13Q05 PA13Q05F

label define PA13Q06F 1 "Never or hardly ever" 2 "Once or twice a year" 3 "Once or twice a month" 4 "Once or twice a week" 5 "Every day or almost every day" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA13Q06 PA13Q06F

label define PA13Q07F 1 "Never or hardly ever" 2 "Once or twice a year" 3 "Once or twice a month" 4 "Once or twice a week" 5 "Every day or almost every day" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA13Q07 PA13Q07F

label define PA14Q01F 1 "Strongly agree" 2 "Agree" 3 "Disagree" 4 "Strongly disagree" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA14Q01 PA14Q01F

label define PA14Q02F 1 "Strongly agree" 2 "Agree" 3 "Disagree" 4 "Strongly disagree" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA14Q02 PA14Q02F

label define PA14Q03F 1 "Strongly agree" 2 "Agree" 3 "Disagree" 4 "Strongly disagree" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA14Q03 PA14Q03F

label define PA14Q04F 1 "Strongly agree" 2 "Agree" 3 "Disagree" 4 "Strongly disagree" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA14Q04 PA14Q04F

label define PA15Q01F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA15Q01 PA15Q01F

label define PA15Q02F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA15Q02 PA15Q02F

label define PA15Q03F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA15Q03 PA15Q03F

label define PA15Q04F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA15Q04 PA15Q04F

label define PA15Q05F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA15Q05 PA15Q05F

label define PA18Q01F 1 "No, Never" 2 "Yes, Once" 3 "Yes, Twice or More" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA18Q01 PA18Q01F

label define PA18Q02F 1 "No, Never" 2 "Yes, Once" 3 "Yes, Twice or More" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA18Q02 PA18Q02F

label define PA18Q03F 1 "No, Never" 2 "Yes, Once" 3 "Yes, Twice or More" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA18Q03 PA18Q03F

label define PA19Q01F 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values PA19Q01 PA19Q01F

label define PA19Q02F 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values PA19Q02 PA19Q02F

label define PA19Q03F 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values PA19Q03 PA19Q03F

label define PA19Q04F 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values PA19Q04 PA19Q04F

label define PA19Q05F 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values PA19Q05 PA19Q05F

label define PA19Q06F 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values PA19Q06 PA19Q06F

label define PA21Q01F 1 "Country of test" 2 "Other country" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA21Q01 PA21Q01F

label define PA21Q02F 1 "Country of test" 2 "Other country" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA21Q02 PA21Q02F

label define PA21Q03F 1 "Country of test" 2 "Other country" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA21Q03 PA21Q03F

label define PA21Q04F 1 "Country of test" 2 "Other country" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA21Q04 PA21Q04F

label define PA21Q05F 1 "Country of test" 2 "Other country" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA21Q05 PA21Q05F

label define PA21Q06F 1 "Country of test" 2 "Other country" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA21Q06 PA21Q06F

label define PA25Q01F 1 "Language of test" 2 "Other language" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA25Q01 PA25Q01F

label define PA25Q02F 1 "Language of test" 2 "Other language" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PA25Q02 PA25Q02F

label define PQCITIZFF 1 "Country of the test only" 2 "Country of the test and other country(s)" 3 "Other country(s)" 9 "Missing" , replace
label values PQCITIZF PQCITIZFF

label define PQCITIZMF 1 "Country of the test only" 2 "Country of the test and other country(s)" 3 "Other country(s)" 9 "Missing" , replace
label values PQCITIZM PQCITIZMF

label define PQEDASPF 1 "ISCED 2" 2 "ISCED 3B, C" 3 "ISCED 3A" 4 "ISCED 4" 5 "ISCED 5B" 6 "ISCED 5A, 6" 9 "Missing" , replace
label values PQEDASP PQEDASPF

label define PQFISCEDF 0 "None" 1 "ISCED 3A" 2 "ISCED 4" 3 "ISCED 5B" 4 "ISCED 5A, 6" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PQFISCED PQFISCEDF

label define PQHISCEDF 0 "None" 1 "ISCED 3A" 2 "ISCED 4" 3 "ISCED 5B" 4 "ISCED 5A, 6" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PQHISCED PQHISCEDF

label define PQIMMIGFF 1 "Native" 2 "Second-Generation" 3 "First-Generation" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PQIMMIGF PQIMMIGFF

label define PQIMMIGMF 1 "Native" 2 "Second-Generation" 3 "First-Generation" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PQIMMIGM PQIMMIGMF

label define PQMISCEDF 0 "None" 1 "ISCED 3A" 2 "ISCED 4" 3 "ISCED 5B" 4 "ISCED 5A, 6" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values PQMISCED PQMISCEDF


* Converting variable names to lowercase
ds
foreach var of varlist _all {
    local lower_var = lower("`var'")
    if "`var'" != "`lower_var'" {
        rename `var' `lower_var'
    }
}

* Saving the data as a .dta file using the same name as the Excel file
save "cleaning/tempdata/parent.dta", replace

