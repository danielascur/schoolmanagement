// Purpose: Converting PISA 2012 "cognitive" dataset from .txt to .dta

* All raw data from PISA 2012 is available at https://www.oecd.org/en/data/datasets/pisa-2012-database.html

* Unzipping the file and extract the .txt file to the temp directory
local zipfile "input/PISA2012/INT_COG12_DEC03.zip"

* Extracting the txt file
unzipfile `zipfile', replace

* Moving the extracted file to the temp directory
copy "INT_COG12_DEC03.txt" "cleaning/tempdata/INT_COG12_DEC03.txt", replace

* Defining the path to the extracted text file
local txtfile "cleaning/tempdata/INT_COG12_DEC03.txt"

* Deleting the file "INT_COG12_DEC03.txt" from the current directory
erase "INT_COG12_DEC03.txt" 

* Reading the fixed-width file using infix
infix ///
str3 CNT   1-  3 ///
str7 SUBNATIO   4- 10 ///
str7 STRATUM  11- 17 ///
OECD  18- 18 ///
str6 NC  19- 24 ///
str7 SCHOOLID  25- 31 ///
str5 STIDSTD  32- 36 ///
BOOKID  37- 38 ///
str1 PM00FQ01  39- 39 ///
str1 PM00GQ01  40- 40 ///
str1 PM00KQ02  41- 41 ///
str1 PM033Q01  42- 42 ///
str1 PM034Q01T  43- 43 ///
str1 PM155Q01  44- 44 ///
str1 PM155Q02D  45- 45 ///
str1 PM155Q03D  46- 46 ///
str1 PM155Q04T  47- 47 ///
str1 PM192Q01T  48- 48 ///
str1 PM273Q01T  49- 49 ///
str1 PM305Q01  50- 50 ///
str1 PM406Q01  51- 51 ///
str1 PM406Q02  52- 52 ///
str1 PM408Q01T  53- 53 ///
str1 PM411Q01  54- 54 ///
str1 PM411Q02  55- 55 ///
str1 PM420Q01T  56- 56 ///
str1 PM423Q01  57- 57 ///
str1 PM442Q02  58- 58 ///
str1 PM446Q01  59- 59 ///
str1 PM446Q02  60- 60 ///
str1 PM447Q01  61- 61 ///
str1 PM462Q01D  62- 62 ///
str1 PM464Q01T  63- 63 ///
str1 PM474Q01  64- 64 ///
str1 PM496Q01T  65- 65 ///
str1 PM496Q02  66- 66 ///
str1 PM559Q01  67- 67 ///
str1 PM564Q01  68- 68 ///
str1 PM564Q02  69- 69 ///
str1 PM571Q01  70- 70 ///
str1 PM603Q01T  71- 71 ///
str1 PM800Q01  72- 72 ///
str1 PM803Q01T  73- 73 ///
str1 PM828Q01  74- 74 ///
str1 PM828Q02  75- 75 ///
str1 PM828Q03  76- 76 ///
str1 PM903Q01  77- 77 ///
str1 PM903Q03  78- 78 ///
str1 PM905Q01T  79- 79 ///
str1 PM905Q02  80- 80 ///
str1 PM906Q01  81- 81 ///
str1 PM906Q02  82- 82 ///
str1 PM909Q01  83- 83 ///
str1 PM909Q02  84- 84 ///
str1 PM909Q03  85- 85 ///
str1 PM915Q01  86- 86 ///
str1 PM915Q02  87- 87 ///
str1 PM918Q01  88- 88 ///
str1 PM918Q02  89- 89 ///
str1 PM918Q05  90- 90 ///
str1 PM919Q01  91- 91 ///
str1 PM919Q02  92- 92 ///
str1 PM923Q01  93- 93 ///
str1 PM923Q03  94- 94 ///
str1 PM923Q04  95- 95 ///
str1 PM924Q02  96- 96 ///
str1 PM934Q01  97- 97 ///
str1 PM934Q02  98- 98 ///
str1 PM936Q01  99- 99 ///
str1 PM936Q02 100-100 ///
str1 PM939Q01 101-101 ///
str1 PM939Q02 102-102 ///
str1 PM942Q01 103-103 ///
str1 PM942Q02 104-104 ///
str1 PM942Q03 105-105 ///
str1 PM943Q01 106-106 ///
str1 PM943Q02 107-107 ///
str1 PM948Q01 108-108 ///
str1 PM948Q02 109-109 ///
str1 PM948Q03 110-110 ///
str1 PM949Q01T 111-111 ///
str1 PM949Q02T 112-112 ///
str1 PM949Q03 113-113 ///
str1 PM953Q02 114-114 ///
str1 PM953Q03 115-115 ///
str1 PM953Q04D 116-116 ///
str1 PM954Q01 117-117 ///
str1 PM954Q02 118-118 ///
str1 PM954Q04 119-119 ///
str1 PM955Q01 120-120 ///
str1 PM955Q02 121-121 ///
str1 PM955Q03 122-122 ///
str1 PM957Q01 123-123 ///
str1 PM957Q02 124-124 ///
str1 PM957Q03 125-125 ///
str1 PM961Q02 126-126 ///
str1 PM961Q03 127-127 ///
str1 PM961Q05 128-128 ///
str1 PM967Q01 129-129 ///
str1 PM967Q03T 130-130 ///
str1 PM982Q01 131-131 ///
str1 PM982Q02 132-132 ///
str1 PM982Q03T 133-133 ///
str1 PM982Q04 134-134 ///
str1 PM985Q01 135-135 ///
str1 PM985Q02 136-136 ///
str1 PM985Q03 137-137 ///
str1 PM991Q01 138-138 ///
str1 PM991Q02D 139-139 ///
str1 PM992Q01 140-140 ///
str1 PM992Q02 141-141 ///
str1 PM992Q03 142-142 ///
str1 PM995Q01 143-143 ///
str1 PM995Q02 144-144 ///
str1 PM995Q03 145-145 ///
str1 PM998Q02 146-146 ///
str1 PM998Q04T 147-147 ///
str1 PR220Q01 148-148 ///
str1 PR220Q02B 149-149 ///
str1 PR220Q04 150-150 ///
str1 PR404Q03 151-151 ///
str1 PR404Q06 152-152 ///
str1 PR404Q07T 153-153 ///
str1 PR404Q10A 154-154 ///
str1 PR404Q10B 155-155 ///
str1 PR406Q01 156-156 ///
str1 PR406Q02 157-157 ///
str1 PR406Q05 158-158 ///
str1 PR412Q01 159-159 ///
str1 PR412Q05 160-160 ///
str1 PR412Q06T 161-161 ///
str1 PR412Q08 162-162 ///
str1 PR420Q02 163-163 ///
str1 PR420Q06 164-164 ///
str1 PR420Q09 165-165 ///
str1 PR420Q10 166-166 ///
str1 PR424Q02T 167-167 ///
str1 PR424Q03 168-168 ///
str1 PR424Q07 169-169 ///
str1 PR432Q01 170-170 ///
str1 PR432Q05 171-171 ///
str1 PR432Q06T 172-172 ///
str1 PR437Q01 173-173 ///
str1 PR437Q06 174-174 ///
str1 PR437Q07 175-175 ///
str1 PR446Q03 176-176 ///
str1 PR446Q06 177-177 ///
str1 PR453Q01 178-178 ///
str1 PR453Q04 179-179 ///
str1 PR453Q05T 180-180 ///
str1 PR453Q06 181-181 ///
str1 PR455Q02 182-182 ///
str1 PR455Q03 183-183 ///
str1 PR455Q04 184-184 ///
str1 PR455Q05T 185-185 ///
str1 PR456Q01 186-186 ///
str1 PR456Q02 187-187 ///
str1 PR456Q06 188-188 ///
str1 PR466Q02 189-189 ///
str1 PR466Q03T 190-190 ///
str1 PR466Q06 191-191 ///
str1 PS131Q02D 192-192 ///
str1 PS131Q04D 193-193 ///
str1 PS256Q01 194-194 ///
str1 PS269Q01 195-195 ///
str1 PS269Q03D 196-196 ///
str1 PS269Q04T 197-197 ///
str1 PS326Q01 198-198 ///
str1 PS326Q02 199-199 ///
str1 PS326Q03 200-200 ///
str1 PS326Q04T 201-201 ///
str1 PS408Q01 202-202 ///
str1 PS408Q03 203-203 ///
str1 PS408Q04T 204-204 ///
str1 PS408Q05 205-205 ///
str1 PS413Q04T 206-206 ///
str1 PS413Q05 207-207 ///
str1 PS413Q06 208-208 ///
str1 PS415Q02 209-209 ///
str1 PS415Q07T 210-210 ///
str1 PS415Q08T 211-211 ///
str1 PS425Q02 212-212 ///
str1 PS425Q03 213-213 ///
str1 PS425Q04 214-214 ///
str1 PS425Q05 215-215 ///
str1 PS428Q01 216-216 ///
str1 PS428Q03 217-217 ///
str1 PS428Q05 218-218 ///
str1 PS438Q01T 219-219 ///
str1 PS438Q02 220-220 ///
str1 PS438Q03D 221-221 ///
str1 PS465Q01 222-222 ///
str1 PS465Q02 223-223 ///
str1 PS465Q04 224-224 ///
str1 PS466Q01T 225-225 ///
str1 PS466Q05 226-226 ///
str1 PS466Q07T 227-227 ///
str1 PS478Q01 228-228 ///
str1 PS478Q02T 229-229 ///
str1 PS478Q03T 230-230 ///
str1 PS498Q02T 231-231 ///
str1 PS498Q03 232-232 ///
str1 PS498Q04 233-233 ///
str1 PS514Q02 234-234 ///
str1 PS514Q03 235-235 ///
str1 PS514Q04 236-236 ///
str1 PS519Q01 237-237 ///
str1 PS519Q02T 238-238 ///
str1 PS519Q03 239-239 ///
str1 PS521Q02 240-240 ///
str1 PS521Q06 241-241 ///
str1 PS527Q01T 242-242 ///
str1 PS527Q03T 243-243 ///
str1 PS527Q04T 244-244 ///
str2 PM155Q02R 245-246 ///
str2 PM155Q03R 247-248 ///
str2 PM462Q01R 249-250 ///
str2 PM953Q04R 251-252 ///
str2 PM991Q02R 253-254 ///
str2 PS131Q02R 255-256 ///
str2 PS131Q04R 257-258 ///
str2 PS269Q03R 259-260 ///
str2 PS438Q03R 261-262 ///
PM034Q01R 263-266 ///
str4 PM155Q04R 267-270 ///
str3 PM192Q01R 271-273 ///
str4 PM273Q01R 274-277 ///
str4 PM408Q01R 278-281 ///
str4 PM420Q01R 282-285 ///
PM464Q01R 286-289 ///
str4 PM496Q01R 290-293 ///
str3 PM603Q01R 294-296 ///
PM803Q01R 297-300 ///
str2 PM905Q01R 301-302 ///
str3 PM949Q01R 303-305 ///
str3 PM949Q02R 306-308 ///
str2 PM967Q03R 309-310 ///
str2 PM982Q03R 311-312 ///
str2 PM998Q04R 313-314 ///
str3 PR404Q07R 315-317 ///
str2 PR412Q06R 318-319 ///
str3 PR424Q02R 320-322 ///
str9 PR432Q06R 323-331 ///
str4 PR453Q05R 332-335 ///
str4 PR455Q05R 336-339 ///
str3 PR466Q03R 340-342 ///
str4 PS269Q04R 343-346 ///
str3 PS326Q04R 347-349 ///
str3 PS408Q04R 350-352 ///
str3 PS413Q04R 353-355 ///
str2 PS415Q07R 356-357 ///
str3 PS415Q08R 358-360 ///
str3 PS438Q01R 361-363 ///
str3 PS466Q01R 364-366 ///
str2 PS466Q07R 367-368 ///
str3 PS478Q02R 369-371 ///
str2 PS478Q03R 372-373 ///
str3 PS498Q02R 374-376 ///
str2 PS519Q02R 377-378 ///
str3 PS527Q01R 379-381 ///
str3 PS527Q03R 382-384 ///
str3 PS527Q04R 385-387 ///
str3 TESTLANG 388-390 ///
str7 VER_COGN 391-397 ///
using `txtfile', clear


* Dealing with missing valuesreplace NC = "" if NC == "777777" | NC == "888888" | NC == "999997" | NC == "999998" | NC == "999999"
replace PM00FQ01 = "" if PM00FQ01 == "7" | PM00FQ01 == "8" | PM00FQ01 == "9"
replace PM00GQ01 = "" if PM00GQ01 == "7" | PM00GQ01 == "8" | PM00GQ01 == "9"
replace PM00KQ02 = "" if PM00KQ02 == "7" | PM00KQ02 == "8" | PM00KQ02 == "9"
replace PM033Q01 = "" if PM033Q01 == "7" | PM033Q01 == "8" | PM033Q01 == "9"
replace PM034Q01T = "" if PM034Q01T == "7" | PM034Q01T == "8" | PM034Q01T == "9"
replace PM155Q01 = "" if PM155Q01 == "7" | PM155Q01 == "8" | PM155Q01 == "9"
replace PM155Q02D = "" if PM155Q02D == "7" | PM155Q02D == "8" | PM155Q02D == "9"
replace PM155Q02R = "" if PM155Q02R == "96" | PM155Q02R == "97" | PM155Q02R == "98" | PM155Q02R == "99"
replace PM155Q03D = "" if PM155Q03D == "7" | PM155Q03D == "8" | PM155Q03D == "9"
replace PM155Q03R = "" if PM155Q03R == "96" | PM155Q03R == "97" | PM155Q03R == "98" | PM155Q03R == "99"
replace PM155Q04R = "" if PM155Q04R == "9997" | PM155Q04R == "9998" | PM155Q04R == "9999"
replace PM155Q04T = "" if PM155Q04T == "7" | PM155Q04T == "8" | PM155Q04T == "9"
replace PM192Q01T = "" if PM192Q01T == "7" | PM192Q01T == "8" | PM192Q01T == "9"
replace PM273Q01R = "" if PM273Q01R == "9997" | PM273Q01R == "9998" | PM273Q01R == "9999"
replace PM273Q01T = "" if PM273Q01T == "7" | PM273Q01T == "8" | PM273Q01T == "9"
replace PM305Q01 = "" if PM305Q01 == "7" | PM305Q01 == "8" | PM305Q01 == "9"
replace PM406Q01 = "" if PM406Q01 == "7" | PM406Q01 == "8" | PM406Q01 == "9"
replace PM406Q02 = "" if PM406Q02 == "7" | PM406Q02 == "8" | PM406Q02 == "9"
replace PM408Q01R = "" if PM408Q01R == "9997" | PM408Q01R == "9998" | PM408Q01R == "9999"
replace PM408Q01T = "" if PM408Q01T == "7" | PM408Q01T == "8" | PM408Q01T == "9"
replace PM411Q01 = "" if PM411Q01 == "7" | PM411Q01 == "8" | PM411Q01 == "9"
replace PM411Q02 = "" if PM411Q02 == "7" | PM411Q02 == "8" | PM411Q02 == "9"
replace PM420Q01R = "" if PM420Q01R == "9997" | PM420Q01R == "9998" | PM420Q01R == "9999"
replace PM420Q01T = "" if PM420Q01T == "7" | PM420Q01T == "8" | PM420Q01T == "9"
replace PM423Q01 = "" if PM423Q01 == "7" | PM423Q01 == "8" | PM423Q01 == "9"
replace PM442Q02 = "" if PM442Q02 == "7" | PM442Q02 == "8" | PM442Q02 == "9"
replace PM446Q01 = "" if PM446Q01 == "7" | PM446Q01 == "8" | PM446Q01 == "9"
replace PM446Q02 = "" if PM446Q02 == "7" | PM446Q02 == "8" | PM446Q02 == "9"
replace PM447Q01 = "" if PM447Q01 == "7" | PM447Q01 == "8" | PM447Q01 == "9"
replace PM462Q01D = "" if PM462Q01D == "7" | PM462Q01D == "8" | PM462Q01D == "9"
replace PM462Q01R = "" if PM462Q01R == "96" | PM462Q01R == "97" | PM462Q01R == "98" | PM462Q01R == "99"
replace PM464Q01T = "" if PM464Q01T == "7" | PM464Q01T == "8" | PM464Q01T == "9"
replace PM474Q01 = "" if PM474Q01 == "7" | PM474Q01 == "8" | PM474Q01 == "9"
replace PM496Q01R = "" if PM496Q01R == "9997" | PM496Q01R == "9998" | PM496Q01R == "9999"
replace PM496Q01T = "" if PM496Q01T == "7" | PM496Q01T == "8" | PM496Q01T == "9"
replace PM496Q02 = "" if PM496Q02 == "7" | PM496Q02 == "8" | PM496Q02 == "9"
replace PM559Q01 = "" if PM559Q01 == "7" | PM559Q01 == "8" | PM559Q01 == "9"
replace PM564Q01 = "" if PM564Q01 == "7" | PM564Q01 == "8" | PM564Q01 == "9"
replace PM564Q02 = "" if PM564Q02 == "7" | PM564Q02 == "8" | PM564Q02 == "9"
replace PM571Q01 = "" if PM571Q01 == "7" | PM571Q01 == "8" | PM571Q01 == "9"
replace PM603Q01T = "" if PM603Q01T == "7" | PM603Q01T == "8" | PM603Q01T == "9"
replace PM800Q01 = "" if PM800Q01 == "7" | PM800Q01 == "8" | PM800Q01 == "9"
replace PM803Q01T = "" if PM803Q01T == "7" | PM803Q01T == "8" | PM803Q01T == "9"
replace PM828Q01 = "" if PM828Q01 == "7" | PM828Q01 == "8" | PM828Q01 == "9"
replace PM828Q02 = "" if PM828Q02 == "7" | PM828Q02 == "8" | PM828Q02 == "9"
replace PM828Q03 = "" if PM828Q03 == "7" | PM828Q03 == "8" | PM828Q03 == "9"
replace PM903Q01 = "" if PM903Q01 == "7" | PM903Q01 == "8" | PM903Q01 == "9"
replace PM903Q03 = "" if PM903Q03 == "7" | PM903Q03 == "8" | PM903Q03 == "9"
replace PM905Q01R = "" if PM905Q01R == "96" | PM905Q01R == "97" | PM905Q01R == "98" | PM905Q01R == "99"
replace PM905Q01T = "" if PM905Q01T == "7" | PM905Q01T == "8" | PM905Q01T == "9"
replace PM905Q02 = "" if PM905Q02 == "7" | PM905Q02 == "8" | PM905Q02 == "9"
replace PM906Q01 = "" if PM906Q01 == "7" | PM906Q01 == "8" | PM906Q01 == "9"
replace PM906Q02 = "" if PM906Q02 == "7" | PM906Q02 == "8" | PM906Q02 == "9"
replace PM909Q01 = "" if PM909Q01 == "7" | PM909Q01 == "8" | PM909Q01 == "9"
replace PM909Q02 = "" if PM909Q02 == "7" | PM909Q02 == "8" | PM909Q02 == "9"
replace PM909Q03 = "" if PM909Q03 == "7" | PM909Q03 == "8" | PM909Q03 == "9"
replace PM915Q01 = "" if PM915Q01 == "7" | PM915Q01 == "8" | PM915Q01 == "9"
replace PM915Q02 = "" if PM915Q02 == "7" | PM915Q02 == "8" | PM915Q02 == "9"
replace PM918Q01 = "" if PM918Q01 == "7" | PM918Q01 == "8" | PM918Q01 == "9"
replace PM918Q02 = "" if PM918Q02 == "7" | PM918Q02 == "8" | PM918Q02 == "9"
replace PM918Q05 = "" if PM918Q05 == "7" | PM918Q05 == "8" | PM918Q05 == "9"
replace PM919Q01 = "" if PM919Q01 == "7" | PM919Q01 == "8" | PM919Q01 == "9"
replace PM919Q02 = "" if PM919Q02 == "7" | PM919Q02 == "8" | PM919Q02 == "9"
replace PM923Q01 = "" if PM923Q01 == "7" | PM923Q01 == "8" | PM923Q01 == "9"
replace PM923Q03 = "" if PM923Q03 == "7" | PM923Q03 == "8" | PM923Q03 == "9"
replace PM923Q04 = "" if PM923Q04 == "7" | PM923Q04 == "8" | PM923Q04 == "9"
replace PM924Q02 = "" if PM924Q02 == "7" | PM924Q02 == "8" | PM924Q02 == "9"
replace PM934Q01 = "" if PM934Q01 == "7" | PM934Q01 == "8" | PM934Q01 == "9"
replace PM934Q02 = "" if PM934Q02 == "7" | PM934Q02 == "8" | PM934Q02 == "9"
replace PM936Q01 = "" if PM936Q01 == "7" | PM936Q01 == "8" | PM936Q01 == "9"
replace PM936Q02 = "" if PM936Q02 == "7" | PM936Q02 == "8" | PM936Q02 == "9"
replace PM939Q01 = "" if PM939Q01 == "7" | PM939Q01 == "8" | PM939Q01 == "9"
replace PM939Q02 = "" if PM939Q02 == "7" | PM939Q02 == "8" | PM939Q02 == "9"
replace PM942Q01 = "" if PM942Q01 == "7" | PM942Q01 == "8" | PM942Q01 == "9"
replace PM942Q02 = "" if PM942Q02 == "7" | PM942Q02 == "8" | PM942Q02 == "9"
replace PM942Q03 = "" if PM942Q03 == "7" | PM942Q03 == "8" | PM942Q03 == "9"
replace PM943Q01 = "" if PM943Q01 == "7" | PM943Q01 == "8" | PM943Q01 == "9"
replace PM943Q02 = "" if PM943Q02 == "7" | PM943Q02 == "8" | PM943Q02 == "9"
replace PM948Q01 = "" if PM948Q01 == "7" | PM948Q01 == "8" | PM948Q01 == "9"
replace PM948Q02 = "" if PM948Q02 == "7" | PM948Q02 == "8" | PM948Q02 == "9"
replace PM948Q03 = "" if PM948Q03 == "7" | PM948Q03 == "8" | PM948Q03 == "9"
replace PM949Q01T = "" if PM949Q01T == "7" | PM949Q01T == "8" | PM949Q01T == "9"
replace PM949Q02T = "" if PM949Q02T == "7" | PM949Q02T == "8" | PM949Q02T == "9"
replace PM949Q03 = "" if PM949Q03 == "7" | PM949Q03 == "8" | PM949Q03 == "9"
replace PM953Q02 = "" if PM953Q02 == "7" | PM953Q02 == "8" | PM953Q02 == "9"
replace PM953Q03 = "" if PM953Q03 == "7" | PM953Q03 == "8" | PM953Q03 == "9"
replace PM953Q04D = "" if PM953Q04D == "7" | PM953Q04D == "8" | PM953Q04D == "9"
replace PM953Q04R = "" if PM953Q04R == "96" | PM953Q04R == "97" | PM953Q04R == "98" | PM953Q04R == "99"
replace PM954Q01 = "" if PM954Q01 == "7" | PM954Q01 == "8" | PM954Q01 == "9"
replace PM954Q02 = "" if PM954Q02 == "7" | PM954Q02 == "8" | PM954Q02 == "9"
replace PM954Q04 = "" if PM954Q04 == "7" | PM954Q04 == "8" | PM954Q04 == "9"
replace PM955Q01 = "" if PM955Q01 == "7" | PM955Q01 == "8" | PM955Q01 == "9"
replace PM955Q02 = "" if PM955Q02 == "7" | PM955Q02 == "8" | PM955Q02 == "9"
replace PM955Q03 = "" if PM955Q03 == "7" | PM955Q03 == "8" | PM955Q03 == "9"
replace PM957Q01 = "" if PM957Q01 == "7" | PM957Q01 == "8" | PM957Q01 == "9"
replace PM957Q02 = "" if PM957Q02 == "7" | PM957Q02 == "8" | PM957Q02 == "9"
replace PM957Q03 = "" if PM957Q03 == "7" | PM957Q03 == "8" | PM957Q03 == "9"
replace PM961Q02 = "" if PM961Q02 == "7" | PM961Q02 == "8" | PM961Q02 == "9"
replace PM961Q03 = "" if PM961Q03 == "7" | PM961Q03 == "8" | PM961Q03 == "9"
replace PM961Q05 = "" if PM961Q05 == "7" | PM961Q05 == "8" | PM961Q05 == "9"
replace PM967Q01 = "" if PM967Q01 == "7" | PM967Q01 == "8" | PM967Q01 == "9"
replace PM967Q03R = "" if PM967Q03R == "96" | PM967Q03R == "97" | PM967Q03R == "98" | PM967Q03R == "99"
replace PM967Q03T = "" if PM967Q03T == "7" | PM967Q03T == "8" | PM967Q03T == "9"
replace PM982Q01 = "" if PM982Q01 == "7" | PM982Q01 == "8" | PM982Q01 == "9"
replace PM982Q02 = "" if PM982Q02 == "7" | PM982Q02 == "8" | PM982Q02 == "9"
replace PM982Q03R = "" if PM982Q03R == "96" | PM982Q03R == "97" | PM982Q03R == "98" | PM982Q03R == "99"
replace PM982Q03T = "" if PM982Q03T == "7" | PM982Q03T == "8" | PM982Q03T == "9"
replace PM982Q04 = "" if PM982Q04 == "7" | PM982Q04 == "8" | PM982Q04 == "9"
replace PM985Q01 = "" if PM985Q01 == "7" | PM985Q01 == "8" | PM985Q01 == "9"
replace PM985Q02 = "" if PM985Q02 == "7" | PM985Q02 == "8" | PM985Q02 == "9"
replace PM985Q03 = "" if PM985Q03 == "7" | PM985Q03 == "8" | PM985Q03 == "9"
replace PM991Q01 = "" if PM991Q01 == "7" | PM991Q01 == "8" | PM991Q01 == "9"
replace PM991Q02D = "" if PM991Q02D == "7" | PM991Q02D == "8" | PM991Q02D == "9"
replace PM991Q02R = "" if PM991Q02R == "96" | PM991Q02R == "97" | PM991Q02R == "98" | PM991Q02R == "99"
replace PM992Q01 = "" if PM992Q01 == "7" | PM992Q01 == "8" | PM992Q01 == "9"
replace PM992Q02 = "" if PM992Q02 == "7" | PM992Q02 == "8" | PM992Q02 == "9"
replace PM992Q03 = "" if PM992Q03 == "7" | PM992Q03 == "8" | PM992Q03 == "9"
replace PM995Q01 = "" if PM995Q01 == "7" | PM995Q01 == "8" | PM995Q01 == "9"
replace PM995Q02 = "" if PM995Q02 == "7" | PM995Q02 == "8" | PM995Q02 == "9"
replace PM995Q03 = "" if PM995Q03 == "7" | PM995Q03 == "8" | PM995Q03 == "9"
replace PM998Q02 = "" if PM998Q02 == "7" | PM998Q02 == "8" | PM998Q02 == "9"
replace PM998Q04R = "" if PM998Q04R == "96" | PM998Q04R == "97" | PM998Q04R == "98" | PM998Q04R == "99"
replace PM998Q04T = "" if PM998Q04T == "7" | PM998Q04T == "8" | PM998Q04T == "9"
replace PR220Q01 = "" if PR220Q01 == "7" | PR220Q01 == "8" | PR220Q01 == "9"
replace PR220Q02B = "" if PR220Q02B == "7" | PR220Q02B == "8" | PR220Q02B == "9"
replace PR220Q04 = "" if PR220Q04 == "7" | PR220Q04 == "8" | PR220Q04 == "9"
replace PR404Q03 = "" if PR404Q03 == "7" | PR404Q03 == "8" | PR404Q03 == "9"
replace PR404Q06 = "" if PR404Q06 == "7" | PR404Q06 == "8" | PR404Q06 == "9"
replace PR404Q07T = "" if PR404Q07T == "7" | PR404Q07T == "8" | PR404Q07T == "9"
replace PR404Q10A = "" if PR404Q10A == "7" | PR404Q10A == "8" | PR404Q10A == "9"
replace PR404Q10B = "" if PR404Q10B == "7" | PR404Q10B == "8" | PR404Q10B == "9"
replace PR406Q01 = "" if PR406Q01 == "7" | PR406Q01 == "8" | PR406Q01 == "9"
replace PR406Q02 = "" if PR406Q02 == "7" | PR406Q02 == "8" | PR406Q02 == "9"
replace PR406Q05 = "" if PR406Q05 == "7" | PR406Q05 == "8" | PR406Q05 == "9"
replace PR412Q01 = "" if PR412Q01 == "7" | PR412Q01 == "8" | PR412Q01 == "9"
replace PR412Q05 = "" if PR412Q05 == "7" | PR412Q05 == "8" | PR412Q05 == "9"
replace PR412Q06R = "" if PR412Q06R == "96" | PR412Q06R == "97" | PR412Q06R == "98" | PR412Q06R == "99"
replace PR412Q06T = "" if PR412Q06T == "7" | PR412Q06T == "8" | PR412Q06T == "9"
replace PR412Q08 = "" if PR412Q08 == "7" | PR412Q08 == "8" | PR412Q08 == "9"
replace PR420Q02 = "" if PR420Q02 == "7" | PR420Q02 == "8" | PR420Q02 == "9"
replace PR420Q06 = "" if PR420Q06 == "7" | PR420Q06 == "8" | PR420Q06 == "9"
replace PR420Q09 = "" if PR420Q09 == "7" | PR420Q09 == "8" | PR420Q09 == "9"
replace PR420Q10 = "" if PR420Q10 == "7" | PR420Q10 == "8" | PR420Q10 == "9"
replace PR424Q02T = "" if PR424Q02T == "7" | PR424Q02T == "8" | PR424Q02T == "9"
replace PR424Q03 = "" if PR424Q03 == "7" | PR424Q03 == "8" | PR424Q03 == "9"
replace PR424Q07 = "" if PR424Q07 == "7" | PR424Q07 == "8" | PR424Q07 == "9"
replace PR432Q01 = "" if PR432Q01 == "7" | PR432Q01 == "8" | PR432Q01 == "9"
replace PR432Q05 = "" if PR432Q05 == "7" | PR432Q05 == "8" | PR432Q05 == "9"
replace PR432Q06T = "" if PR432Q06T == "7" | PR432Q06T == "8" | PR432Q06T == "9"
replace PR437Q01 = "" if PR437Q01 == "7" | PR437Q01 == "8" | PR437Q01 == "9"
replace PR437Q06 = "" if PR437Q06 == "7" | PR437Q06 == "8" | PR437Q06 == "9"
replace PR437Q07 = "" if PR437Q07 == "7" | PR437Q07 == "8" | PR437Q07 == "9"
replace PR446Q03 = "" if PR446Q03 == "7" | PR446Q03 == "8" | PR446Q03 == "9"
replace PR446Q06 = "" if PR446Q06 == "7" | PR446Q06 == "8" | PR446Q06 == "9"
replace PR453Q01 = "" if PR453Q01 == "7" | PR453Q01 == "8" | PR453Q01 == "9"
replace PR453Q04 = "" if PR453Q04 == "7" | PR453Q04 == "8" | PR453Q04 == "9"
replace PR453Q05R = "" if PR453Q05R == "9997" | PR453Q05R == "9998" | PR453Q05R == "9999"
replace PR453Q05T = "" if PR453Q05T == "7" | PR453Q05T == "8" | PR453Q05T == "9"
replace PR453Q06 = "" if PR453Q06 == "7" | PR453Q06 == "8" | PR453Q06 == "9"
replace PR455Q02 = "" if PR455Q02 == "7" | PR455Q02 == "8" | PR455Q02 == "9"
replace PR455Q03 = "" if PR455Q03 == "7" | PR455Q03 == "8" | PR455Q03 == "9"
replace PR455Q04 = "" if PR455Q04 == "7" | PR455Q04 == "8" | PR455Q04 == "9"
replace PR455Q05R = "" if PR455Q05R == "9997" | PR455Q05R == "9998" | PR455Q05R == "9999"
replace PR455Q05T = "" if PR455Q05T == "7" | PR455Q05T == "8" | PR455Q05T == "9"
replace PR456Q01 = "" if PR456Q01 == "7" | PR456Q01 == "8" | PR456Q01 == "9"
replace PR456Q02 = "" if PR456Q02 == "7" | PR456Q02 == "8" | PR456Q02 == "9"
replace PR456Q06 = "" if PR456Q06 == "7" | PR456Q06 == "8" | PR456Q06 == "9"
replace PR466Q02 = "" if PR466Q02 == "7" | PR466Q02 == "8" | PR466Q02 == "9"
replace PR466Q03T = "" if PR466Q03T == "7" | PR466Q03T == "8" | PR466Q03T == "9"
replace PR466Q06 = "" if PR466Q06 == "7" | PR466Q06 == "8" | PR466Q06 == "9"
replace PS131Q02D = "" if PS131Q02D == "7" | PS131Q02D == "8" | PS131Q02D == "9"
replace PS131Q02R = "" if PS131Q02R == "96" | PS131Q02R == "97" | PS131Q02R == "98" | PS131Q02R == "99"
replace PS131Q04D = "" if PS131Q04D == "7" | PS131Q04D == "8" | PS131Q04D == "9"
replace PS131Q04R = "" if PS131Q04R == "96" | PS131Q04R == "97" | PS131Q04R == "98" | PS131Q04R == "99"
replace PS256Q01 = "" if PS256Q01 == "7" | PS256Q01 == "8" | PS256Q01 == "9"
replace PS269Q01 = "" if PS269Q01 == "7" | PS269Q01 == "8" | PS269Q01 == "9"
replace PS269Q03D = "" if PS269Q03D == "7" | PS269Q03D == "8" | PS269Q03D == "9"
replace PS269Q03R = "" if PS269Q03R == "96" | PS269Q03R == "97" | PS269Q03R == "98" | PS269Q03R == "99"
replace PS269Q04R = "" if PS269Q04R == "9997" | PS269Q04R == "9998" | PS269Q04R == "9999"
replace PS269Q04T = "" if PS269Q04T == "7" | PS269Q04T == "8" | PS269Q04T == "9"
replace PS326Q01 = "" if PS326Q01 == "7" | PS326Q01 == "8" | PS326Q01 == "9"
replace PS326Q02 = "" if PS326Q02 == "7" | PS326Q02 == "8" | PS326Q02 == "9"
replace PS326Q03 = "" if PS326Q03 == "7" | PS326Q03 == "8" | PS326Q03 == "9"
replace PS326Q04T = "" if PS326Q04T == "7" | PS326Q04T == "8" | PS326Q04T == "9"
replace PS408Q01 = "" if PS408Q01 == "7" | PS408Q01 == "8" | PS408Q01 == "9"
replace PS408Q03 = "" if PS408Q03 == "7" | PS408Q03 == "8" | PS408Q03 == "9"
replace PS408Q04T = "" if PS408Q04T == "7" | PS408Q04T == "8" | PS408Q04T == "9"
replace PS408Q05 = "" if PS408Q05 == "7" | PS408Q05 == "8" | PS408Q05 == "9"
replace PS413Q04T = "" if PS413Q04T == "7" | PS413Q04T == "8" | PS413Q04T == "9"
replace PS413Q05 = "" if PS413Q05 == "7" | PS413Q05 == "8" | PS413Q05 == "9"
replace PS413Q06 = "" if PS413Q06 == "7" | PS413Q06 == "8" | PS413Q06 == "9"
replace PS415Q02 = "" if PS415Q02 == "7" | PS415Q02 == "8" | PS415Q02 == "9"
replace PS415Q07R = "" if PS415Q07R == "96" | PS415Q07R == "97" | PS415Q07R == "98" | PS415Q07R == "99"
replace PS415Q07T = "" if PS415Q07T == "7" | PS415Q07T == "8" | PS415Q07T == "9"
replace PS415Q08T = "" if PS415Q08T == "7" | PS415Q08T == "8" | PS415Q08T == "9"
replace PS425Q02 = "" if PS425Q02 == "7" | PS425Q02 == "8" | PS425Q02 == "9"
replace PS425Q03 = "" if PS425Q03 == "7" | PS425Q03 == "8" | PS425Q03 == "9"
replace PS425Q04 = "" if PS425Q04 == "7" | PS425Q04 == "8" | PS425Q04 == "9"
replace PS425Q05 = "" if PS425Q05 == "7" | PS425Q05 == "8" | PS425Q05 == "9"
replace PS428Q01 = "" if PS428Q01 == "7" | PS428Q01 == "8" | PS428Q01 == "9"
replace PS428Q03 = "" if PS428Q03 == "7" | PS428Q03 == "8" | PS428Q03 == "9"
replace PS428Q05 = "" if PS428Q05 == "7" | PS428Q05 == "8" | PS428Q05 == "9"
replace PS438Q01T = "" if PS438Q01T == "7" | PS438Q01T == "8" | PS438Q01T == "9"
replace PS438Q02 = "" if PS438Q02 == "7" | PS438Q02 == "8" | PS438Q02 == "9"
replace PS438Q03D = "" if PS438Q03D == "7" | PS438Q03D == "8" | PS438Q03D == "9"
replace PS438Q03R = "" if PS438Q03R == "96" | PS438Q03R == "97" | PS438Q03R == "98" | PS438Q03R == "99"
replace PS465Q01 = "" if PS465Q01 == "7" | PS465Q01 == "8" | PS465Q01 == "9"
replace PS465Q02 = "" if PS465Q02 == "7" | PS465Q02 == "8" | PS465Q02 == "9"
replace PS465Q04 = "" if PS465Q04 == "7" | PS465Q04 == "8" | PS465Q04 == "9"
replace PS466Q01T = "" if PS466Q01T == "7" | PS466Q01T == "8" | PS466Q01T == "9"
replace PS466Q05 = "" if PS466Q05 == "7" | PS466Q05 == "8" | PS466Q05 == "9"
replace PS466Q07R = "" if PS466Q07R == "96" | PS466Q07R == "97" | PS466Q07R == "98" | PS466Q07R == "99"
replace PS466Q07T = "" if PS466Q07T == "7" | PS466Q07T == "8" | PS466Q07T == "9"
replace PS478Q01 = "" if PS478Q01 == "7" | PS478Q01 == "8" | PS478Q01 == "9"
replace PS478Q02T = "" if PS478Q02T == "7" | PS478Q02T == "8" | PS478Q02T == "9"
replace PS478Q03R = "" if PS478Q03R == "96" | PS478Q03R == "97" | PS478Q03R == "98" | PS478Q03R == "99"
replace PS478Q03T = "" if PS478Q03T == "7" | PS478Q03T == "8" | PS478Q03T == "9"
replace PS498Q02T = "" if PS498Q02T == "7" | PS498Q02T == "8" | PS498Q02T == "9"
replace PS498Q03 = "" if PS498Q03 == "7" | PS498Q03 == "8" | PS498Q03 == "9"
replace PS498Q04 = "" if PS498Q04 == "7" | PS498Q04 == "8" | PS498Q04 == "9"
replace PS514Q02 = "" if PS514Q02 == "7" | PS514Q02 == "8" | PS514Q02 == "9"
replace PS514Q03 = "" if PS514Q03 == "7" | PS514Q03 == "8" | PS514Q03 == "9"
replace PS514Q04 = "" if PS514Q04 == "7" | PS514Q04 == "8" | PS514Q04 == "9"
replace PS519Q01 = "" if PS519Q01 == "7" | PS519Q01 == "8" | PS519Q01 == "9"
replace PS519Q02R = "" if PS519Q02R == "96" | PS519Q02R == "97" | PS519Q02R == "98" | PS519Q02R == "99"
replace PS519Q02T = "" if PS519Q02T == "7" | PS519Q02T == "8" | PS519Q02T == "9"
replace PS519Q03 = "" if PS519Q03 == "7" | PS519Q03 == "8" | PS519Q03 == "9"
replace PS521Q02 = "" if PS521Q02 == "7" | PS521Q02 == "8" | PS521Q02 == "9"
replace PS521Q06 = "" if PS521Q06 == "7" | PS521Q06 == "8" | PS521Q06 == "9"
replace PS527Q01T = "" if PS527Q01T == "7" | PS527Q01T == "8" | PS527Q01T == "9"
replace PS527Q03T = "" if PS527Q03T == "7" | PS527Q03T == "8" | PS527Q03T == "9"
replace PS527Q04T = "" if PS527Q04T == "7" | PS527Q04T == "8" | PS527Q04T == "9"
replace BOOKID = . if BOOKID == 96 | BOOKID == 97 | BOOKID == 98 | BOOKID == 99
replace PM034Q01R = . if PM034Q01R == 9997 | PM034Q01R == 9998 | PM034Q01R == 9999
replace PM464Q01R = . if PM464Q01R == 9997 | PM464Q01R == 9998 | PM464Q01R == 9999
replace PM803Q01R = . if PM803Q01R == 9997 | PM803Q01R == 9998 | PM803Q01R == 9999


* Including variable labels 
label variable NC "National Centre 6-digit Code"
label variable CNT "Country code 3-character"
label variable OECD "OECD country"
label variable SUBNATIO "Adjudicated sub-region code 7-digit code (3-digit country code + region ID + stratum ID)"
label variable STRATUM "Stratum ID 7-character (cnt + region ID + original stratum ID)"
label variable SCHOOLID "School ID 7-digit (region ID + stratum ID + 3-digit school ID)"
label variable STIDSTD "Student ID"
label variable BOOKID "Booklet"
label variable PM00FQ01 "MATH - P2012 Apartment Purchase Q1"
label variable PM00GQ01 "MATH - P2012 An Advertising Column Q1"
label variable PM00KQ02 "MATH - P2012 Wheelchair Basketball Q2"
label variable PM033Q01 "MATH - P2000 A View with a Room Q1"
label variable PM034Q01T "MATH - P2000 Bricks Q1"
label variable PM155Q01 "MATH - P2000 Pop Pyramids Q1"
label variable PM155Q02D "MATH - P2000 Pop Pyramids Q2"
label variable PM155Q03D "MATH - P2000 Pop Pyramids Q3"
label variable PM155Q04T "MATH - P2000 Pop Pyramids Q4"
label variable PM192Q01T "MATH - P2000 Containers Q1"
label variable PM273Q01T "MATH - P2000 Pipelines Q1"
label variable PM305Q01 "MATH - P2000 Map Q1"
label variable PM406Q01 "MATH - P2003 Running Tracks Q1"
label variable PM406Q02 "MATH - P2003 Running Tracks Q2"
label variable PM408Q01T "MATH - P2003 Lotteries Q1"
label variable PM411Q01 "MATH - P2003 Diving Q1"
label variable PM411Q02 "MATH - P2003 Diving Q2"
label variable PM420Q01T "MATH - P2003 Transport Q1"
label variable PM423Q01 "MATH - P2003 Tossing Coins Q1"
label variable PM442Q02 "MATH - P2003 Braille Q2"
label variable PM446Q01 "MATH - P2003 The Thermometer Cricket Q1"
label variable PM446Q02 "MATH - P2003 The Thermometer Cricket Q2"
label variable PM447Q01 "MATH - P2003 Tile Arrangement Q1"
label variable PM462Q01D "MATH - P2003 The Third Side Q1"
label variable PM464Q01T "MATH - P2003 The Fence Q1"
label variable PM474Q01 "MATH - P2003 Running Time Q1"
label variable PM496Q01T "MATH - P2003 Cash Withdrawal Q1"
label variable PM496Q02 "MATH - P2003 Cash Withdrawal Q2"
label variable PM559Q01 "MATH - P2003 Telephone Rates Q1"
label variable PM564Q01 "MATH - P2003 Chair Lift Q1"
label variable PM564Q02 "MATH - P2003 Chair Lift Q2"
label variable PM571Q01 "MATH - P2003 Stop the Car Q1"
label variable PM603Q01T "MATH - P2003 Number Check Q1"
label variable PM800Q01 "MATH - P2003 Computer Game Q1"
label variable PM803Q01T "MATH - P2003 Labels Q1"
label variable PM828Q01 "MATH - P2003 Carbon Dioxide Q1"
label variable PM828Q02 "MATH - P2003 Carbon Dioxide Q2"
label variable PM828Q03 "MATH - P2003 Carbon Dioxide Q3"
label variable PM903Q01 "MATH - P2012 Drip Rate Q1"
label variable PM903Q03 "MATH - P2012 Drip Rate Q3"
label variable PM905Q01T "MATH - P2012 Tennis Balls Q1"
label variable PM905Q02 "MATH - P2012 Tennis Balls Q2"
label variable PM906Q01 "MATH - P2012 Crazy Ants Q1"
label variable PM906Q02 "MATH - P2012 Crazy Ants Q2"
label variable PM909Q01 "MATH - P2012 Speeding Fines Q1"
label variable PM909Q02 "MATH - P2012 Speeding Fines Q2"
label variable PM909Q03 "MATH - P2012 Speeding Fines Q3"
label variable PM915Q01 "MATH - P2012 Carbon Tax Q1"
label variable PM915Q02 "MATH - P2012 Carbon Tax Q2"
label variable PM918Q01 "MATH - P2012 Charts Q1"
label variable PM918Q02 "MATH - P2012 Charts Q2"
label variable PM918Q05 "MATH - P2012 Charts Q5"
label variable PM919Q01 "MATH - P2012 Zs Fan Merchandise Q1"
label variable PM919Q02 "MATH - P2012 Zs Fan Merchandise Q2"
label variable PM923Q01 "MATH - P2012 Sailing Ships Q1"
label variable PM923Q03 "MATH - P2012 Sailing Ships Q3"
label variable PM923Q04 "MATH - P2012 Sailing Ships Q4"
label variable PM924Q02 "MATH - P2012 Sauce Q2"
label variable PM934Q01 "MATH - P2012 London Eye Q1"
label variable PM934Q02 "MATH - P2012 London Eye Q2"
label variable PM936Q01 "MATH - P2012 Seats In A Theatre Q1"
label variable PM936Q02 "MATH - P2012 Seats In A Theatre Q2"
label variable PM939Q01 "MATH - P2012 Racing Q1"
label variable PM939Q02 "MATH - P2012 Racing Q2"
label variable PM942Q01 "MATH - P2012 Climbing Mount Fuji Q1"
label variable PM942Q02 "MATH - P2012 Climbing Mount Fuji Q2"
label variable PM942Q03 "MATH - P2012 Climbing Mount Fuji Q3"
label variable PM943Q01 "MATH - P2012 Arches Q1"
label variable PM943Q02 "MATH - P2012 Arches Q2"
label variable PM948Q01 "MATH - P2012 Part-Time Work Q1"
label variable PM948Q02 "MATH - P2012 Part-Time Work Q2"
label variable PM948Q03 "MATH - P2012 Part-Time Work Q3"
label variable PM949Q01T "MATH - P2012 Roof Truss Design Q1"
label variable PM949Q02T "MATH - P2012 Roof Truss Design Q2"
label variable PM949Q03 "MATH - P2012 Roof Truss Design Q3"
label variable PM953Q02 "MATH - P2012 Flu Test Q2"
label variable PM953Q03 "MATH - P2012 Flu Test Q3"
label variable PM953Q04D "MATH - P2012 Flu Test Q4"
label variable PM954Q01 "MATH - P2012 Medicine Doses Q1"
label variable PM954Q02 "MATH - P2012 Medicine Doses Q2"
label variable PM954Q04 "MATH - P2012 Medicine Doses Q4"
label variable PM955Q01 "MATH - P2012 Migration Q1"
label variable PM955Q02 "MATH - P2012 Migration Q2"
label variable PM955Q03 "MATH - P2012 Migration Q3"
label variable PM957Q01 "MATH - P2012 Helen The Cyclist Q1"
label variable PM957Q02 "MATH - P2012 Helen The Cyclist Q2"
label variable PM957Q03 "MATH - P2012 Helen The Cyclist Q3"
label variable PM961Q02 "MATH - P2012 Chocolate Q2"
label variable PM961Q03 "MATH - P2012 Chocolate Q3"
label variable PM961Q05 "MATH - P2012 Chocolate Q5"
label variable PM967Q01 "MATH - P2012 Wooden Train Set Q1"
label variable PM967Q03T "MATH - P2012 Wooden Train Set Q3"
label variable PM982Q01 "MATH - P2012 Employment Data Q1"
label variable PM982Q02 "MATH - P2012 Employment Data Q2"
label variable PM982Q03T "MATH - P2012 Employment Data Q3"
label variable PM982Q04 "MATH - P2012 Employment Data Q4"
label variable PM985Q01 "MATH - P2012 Which Car Q1"
label variable PM985Q02 "MATH - P2012 Which Car Q2"
label variable PM985Q03 "MATH - P2012 Which Car Q3"
label variable PM991Q01 "MATH - P2012 Garage Q1"
label variable PM991Q02D "MATH - P2012 Garage Q2"
label variable PM992Q01 "MATH - P2012 Spacers Q1"
label variable PM992Q02 "MATH - P2012 Spacers Q2"
label variable PM992Q03 "MATH - P2012 Spacers Q3"
label variable PM995Q01 "MATH - P2012 Revolving Door Q1"
label variable PM995Q02 "MATH - P2012 Revolving Door Q2"
label variable PM995Q03 "MATH - P2012 Revolving Door Q3"
label variable PM998Q02 "MATH - P2012 Bike Rental Q2"
label variable PM998Q04T "MATH - P2012 Bike Rental Q4"
label variable PR220Q01 "READ - P2000 South Pole Q1"
label variable PR220Q02B "READ - P2000 South Pole Q2B"
label variable PR220Q04 "READ - P2000 South Pole Q4"
label variable PR404Q03 "READ - P2009 Sleep Q3"
label variable PR404Q06 "READ - P2009 Sleep Q6"
label variable PR404Q07T "READ - P2009 Sleep Q7"
label variable PR404Q10A "READ - P2009 Sleep Q10A"
label variable PR404Q10B "READ - P2009 Sleep Q10B"
label variable PR406Q01 "READ - P2009 Kokeshi Dolls Q1"
label variable PR406Q02 "READ - P2009 Kokeshi Dolls Q2"
label variable PR406Q05 "READ - P2009 Kokeshi Dolls Q5"
label variable PR412Q01 "READ - P2009 World Languages Q1"
label variable PR412Q05 "READ - P2009 World Languages Q5"
label variable PR412Q06T "READ - P2009 World Languages Q6"
label variable PR412Q08 "READ - P2009 World Languages Q8"
label variable PR420Q02 "READ - P2009 Childrens Futures Q2"
label variable PR420Q06 "READ - P2009 Childrens Futures Q6"
label variable PR420Q09 "READ - P2009 Childrens Futures Q9"
label variable PR420Q10 "READ - P2009 Childrens Futures Q10"
label variable PR424Q02T "READ - P2009 Fair Trade Q2"
label variable PR424Q03 "READ - P2009 Fair Trade Q3"
label variable PR424Q07 "READ - P2009 Fair Trade Q7"
label variable PR432Q01 "READ - P2009 About a book Q1"
label variable PR432Q05 "READ - P2009 About a book Q5"
label variable PR432Q06T "READ - P2009 About a book Q6"
label variable PR437Q01 "READ - P2009 Narcissus Q1"
label variable PR437Q06 "READ - P2009 Narcissus Q6"
label variable PR437Q07 "READ - P2009 Narcissus Q7"
label variable PR446Q03 "READ - P2009 Job Vacancy Q3"
label variable PR446Q06 "READ - P2009 Job Vacancy Q6"
label variable PR453Q01 "READ - P2009 Find Summer Job Q1"
label variable PR453Q04 "READ - P2009 Find Summer Job Q4"
label variable PR453Q05T "READ - P2009 Find Summer Job Q5"
label variable PR453Q06 "READ - P2009 Find Summer Job Q6"
label variable PR455Q02 "READ - P2009 Chocolate and Health Q2"
label variable PR455Q03 "READ - P2009 Chocolate and Health Q3"
label variable PR455Q04 "READ - P2009 Chocolate and Health Q4"
label variable PR455Q05T "READ - P2009 Chocolate and Health Q5"
label variable PR456Q01 "READ - P2009 Biscuits Q1"
label variable PR456Q02 "READ - P2009 Biscuits Q2"
label variable PR456Q06 "READ - P2009 Biscuits Q6"
label variable PR466Q02 "READ - P2009 Work Right Q2"
label variable PR466Q03T "READ - P2009 Work Right Q3"
label variable PR466Q06 "READ - P2009 Work Right Q6"
label variable PS131Q02D "SCIE - P2000 Good Vibrations Q2"
label variable PS131Q04D "SCIE - P2006 Good Vibrations Q4"
label variable PS256Q01 "SCIE - P2000 Spoons Q1"
label variable PS269Q01 "SCIE - P2000 Earths Temperature Q1"
label variable PS269Q03D "SCIE - P2000 Earths Temperature Q3"
label variable PS269Q04T "SCIE - P2000 Earths Temperature Q4"
label variable PS326Q01 "SCIE - P2003 Milk Q1"
label variable PS326Q02 "SCIE - P2003 Milk Q2"
label variable PS326Q03 "SCIE - P2003 Milk Q3"
label variable PS326Q04T "SCIE - P2003 Milk Q4"
label variable PS408Q01 "SCIE - P2006 Wild Oat Grass Q1"
label variable PS408Q03 "SCIE - P2006 Wild Oat Grass Q3"
label variable PS408Q04T "SCIE - P2006 Wild Oat Grass Q4"
label variable PS408Q05 "SCIE - P2006 Wild Oat Grass Q5"
label variable PS413Q04T "SCIE - P2006 Plastic Age Q4"
label variable PS413Q05 "SCIE - P2006 Plastic Age Q5"
label variable PS413Q06 "SCIE - P2006 Plastic Age Q6"
label variable PS415Q02 "SCIE - P2006 Solar Panels Q2"
label variable PS415Q07T "SCIE - P2006 Solar Panels Q7"
label variable PS415Q08T "SCIE - P2006 Solar Panels Q8"
label variable PS425Q02 "SCIE - P2006 Penguin Island Q2"
label variable PS425Q03 "SCIE - P2006 Penguin Island Q3"
label variable PS425Q04 "SCIE - P2006 Penguin Island Q4"
label variable PS425Q05 "SCIE - P2006 Penguin Island Q5"
label variable PS428Q01 "SCIE - P2006 Bacteria in Milk Q1"
label variable PS428Q03 "SCIE - P2006 Bacteria in Milk Q3"
label variable PS428Q05 "SCIE - P2006 Bacteria in Milk Q5"
label variable PS438Q01T "SCIE - P2006 Green Parks Q1"
label variable PS438Q02 "SCIE - P2006 Green Parks Q2"
label variable PS438Q03D "SCIE - P2006 Green Parks Q3"
label variable PS465Q01 "SCIE - P2006 Different Climates Q1"
label variable PS465Q02 "SCIE - P2006 Different Climates Q2"
label variable PS465Q04 "SCIE - P2006 Different Climates Q4"
label variable PS466Q01T "SCIE - P2006 Forest Fires Q1"
label variable PS466Q05 "SCIE - P2006 Forest Fires Q5"
label variable PS466Q07T "SCIE - P2006 Forest Fires Q7"
label variable PS478Q01 "SCIE - P2006 Antibiotics Q1"
label variable PS478Q02T "SCIE - P2006 Antibiotics Q2"
label variable PS478Q03T "SCIE - P2006 Antibiotics Q3"
label variable PS498Q02T "SCIE - P2006 Experimental Digestion Q2"
label variable PS498Q03 "SCIE - P2006 Experimental Digestion Q3"
label variable PS498Q04 "SCIE - P2006 Experimental Digestion Q4"
label variable PS514Q02 "SCIE - P2006 Development and Disaster Q2"
label variable PS514Q03 "SCIE - P2006 Development and Disaster Q3"
label variable PS514Q04 "SCIE - P2006 Development and Disaster Q4"
label variable PS519Q01 "SCIE - P2006 Airbags Q1"
label variable PS519Q02T "SCIE - P2006 Airbags Q2"
label variable PS519Q03 "SCIE - P2006 Airbags Q3"
label variable PS521Q02 "SCIE - P2006 Cooking Outdoors Q2"
label variable PS521Q06 "SCIE - P2006 Cooking Outdoors Q6"
label variable PS527Q01T "SCIE - P2006 Extinction of the Dinosaurs Q1"
label variable PS527Q03T "SCIE - P2006 Extinction of the Dinosaurs Q3"
label variable PS527Q04T "SCIE - P2006 Extinction of the Dinosaurs Q4"
label variable PM155Q02R "MATH - P2000 Pop Pyramids Q2 - original responses"
label variable PM155Q03R "MATH - P2000 Pop Pyramids Q3 - original responses"
label variable PM462Q01R "MATH - P2003 The Third Side Q1 - original responses"
label variable PM953Q04R "MATH - P2012 Flu Test Q4 - original responses"
label variable PM991Q02R "MATH - P2012 Garage Q2 - original responses"
label variable PS131Q02R "SCIE - P2000 Good Vibrations Q2 - original responses"
label variable PS131Q04R "SCIE - P2006 Good Vibrations Q4 - original responses"
label variable PS269Q03R "SCIE - P2000 Earths Temperature Q3 - original responses"
label variable PS438Q03R "SCIE - P2006 Green Parks Q3 - original responses"
label variable PM034Q01R "MATH - P2000 Bricks Q1 - original responses"
label variable PM155Q04R "MATH - P2000 Pop Pyramids Q4 - original responses"
label variable PM192Q01R "MATH - P2000 Containers Q1 - original responses"
label variable PM273Q01R "MATH - P2000 Pipelines Q1 - original responses"
label variable PM408Q01R "MATH - P2003 Lotteries Q1 - original responses"
label variable PM420Q01R "MATH - P2003 Transport Q1 - original responses"
label variable PM464Q01R "MATH - P2003 The Fence Q1 - original responses"
label variable PM496Q01R "MATH - P2003 Cash Withdrawal Q1 - original responses"
label variable PM603Q01R "MATH - P2003 Number Check Q1 - original responses"
label variable PM803Q01R "MATH - P2003 Labels Q1 - original responses"
label variable PM905Q01R "MATH - P2012 Tennis Balls Q1 - original responses"
label variable PM949Q01R "MATH - P2012 Roof Truss Design Q1 - original responses"
label variable PM949Q02R "MATH - P2012 Roof Truss Design Q2 - original responses"
label variable PM967Q03R "MATH - P2012 Wooden Train Set Q3 - original responses"
label variable PM982Q03R "MATH - P2012 Employment Data Q3 - original responses"
label variable PM998Q04R "MATH - P2012 Bike Rental Q4 - original responses"
label variable PR404Q07R "READ - P2009 Sleep Q7 - original responses"
label variable PR412Q06R "READ - P2009 World Languages Q6 - original responses"
label variable PR424Q02R "READ - P2009 Fair Trade Q2 - original responses"
label variable PR432Q06R "READ - P2009 About a book Q6 - original responses"
label variable PR453Q05R "READ - P2009 Find Summer Job Q5 - original responses"
label variable PR455Q05R "READ - P2009 Chocolate and Health Q5 - original responses"
label variable PR466Q03R "READ - P2009 Work Right Q3 - original responses"
label variable PS269Q04R "SCIE - P2000 Earths Temperature Q4 - original responses"
label variable PS326Q04R "SCIE - P2003 Milk Q4 - original responses"
label variable PS408Q04R "SCIE - P2006 Wild Oat Grass Q4 - original responses"
label variable PS413Q04R "SCIE - P2006 Plastic Age Q4 - original responses"
label variable PS415Q07R "SCIE - P2006 Solar Panels Q7 - original responses"
label variable PS415Q08R "SCIE - P2006 Solar Panels Q8 - original responses"
label variable PS438Q01R "SCIE - P2006 Green Parks Q1 - original responses"
label variable PS466Q01R "SCIE - P2006 Forest Fires Q1 - original responses"
label variable PS466Q07R "SCIE - P2006 Forest Fires Q7 - original responses"
label variable PS478Q02R "SCIE - P2006 Antibiotics Q2 - original responses"
label variable PS478Q03R "SCIE - P2006 Antibiotics Q3 - original responses"
label variable PS498Q02R "SCIE - P2006 Experimental Digestion Q2 - original responses"
label variable PS519Q02R "SCIE - P2006 Airbags Q2 - original responses"
label variable PS527Q01R "SCIE - P2006 Extinction of the Dinosaurs Q1 - original responses"
label variable PS527Q03R "SCIE - P2006 Extinction of the Dinosaurs Q3 - original responses"
label variable PS527Q04R "SCIE - P2006 Extinction of the Dinosaurs Q4 - original responses"
label variable TESTLANG "Language of Test (3-character)"
label variable VER_COGN "Date of cognitive database release"


* Including value labels 
label define OECDF 0 "Non-OECD" 1 "OECD" , replace
label values OECD OECDF

label define BOOKIDF 1 "booklet 1" 2 "booklet 2" 3 "booklet 3" 4 "booklet 4" 5 "booklet 5" 6 "booklet 6" 7 "booklet 7" 8 "booklet 8" 9 "booklet 9" 10 "booklet 10" 11 "booklet 11" 12 "booklet 12" 13 "booklet 13" 21 "booklet 21" 22 "booklet 22" 23 "booklet 23" 24 "booklet 24" 25 "booklet 25" 26 "booklet 26" 27 "booklet 27" 20 "UH booklet" 99 "Missing" , replace
label values BOOKID BOOKIDF


* Converting variable names to lowercase
ds
foreach var of varlist _all {
    local lower_var = lower("`var'")
    if "`var'" != "`lower_var'" {
        rename `var' `lower_var'
    }
}

* Saving the data as a .dta file using the same name as the Excel file
save "cleaning/tempdata/cognitive.dta", replace

