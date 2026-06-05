// Purpose: Converting PISA 2012 "cognitive score" dataset from .txt to .dta

* All raw data from PISA 2012 is available at https://www.oecd.org/en/data/datasets/pisa-2012-database.html

* Unzipping the file and extract the .txt file to the temp directory
local zipfile "input/PISA2012/INT_COG12_S_DEC03.zip"

* Extracting the txt file
unzipfile `zipfile', replace

* Moving the extracted file to the temp directory
copy "INT_COG12_S_DEC03.txt" "cleaning/tempdata/INT_COG12_S_DEC03.txt", replace

* Defining the path to the extracted text file
local txtfile "cleaning/tempdata/INT_COG12_S_DEC03.txt"

* Deleting the file "INT_COG12_S_DEC03.txt" from the current directory
erase "INT_COG12_S_DEC03.txt" 

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
str3 TESTLANG 245-247 ///
str7 VER_COGS 248-254 ///
using `txtfile', clear


* Dealing with missing valuesreplace NC = "" if NC == "777777" | NC == "888888" | NC == "999997" | NC == "999998" | NC == "999999"
replace BOOKID = . if BOOKID == 96 | BOOKID == 97 | BOOKID == 98 | BOOKID == 99


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
label variable VER_COGS "Date of scored cognitive database release"


* Including value labels 
label define OECDF 0 "Non-OECD" 1 "OECD" , replace
label values OECD OECDF


* Converting variable names to lowercase
ds
foreach var of varlist _all {
    local lower_var = lower("`var'")
    if "`var'" != "`lower_var'" {
        rename `var' `lower_var'
    }
}

* Saving the data as a .dta file using the same name as the Excel file
save "cleaning/tempdata/cognitive_score.dta", replace

