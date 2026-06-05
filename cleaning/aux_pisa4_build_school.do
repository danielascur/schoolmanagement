// Purpose: COnverting PISA 2012 "school" dataset from .txt to .dta

* All raw data from PISA 2012 is available at https://www.oecd.org/en/data/datasets/pisa-2012-database.html

* Unzipping the file and extract the .txt file to the temp directory
local zipfile "input/PISA2012/INT_SCQ12_DEC03.zip"

* Extracting the txt file
unzipfile `zipfile', replace

* Moving the extracted file to the temp directory
copy "INT_SCQ12_DEC03.txt" "cleaning/tempdata/INT_SCQ12_DEC03.txt", replace

* Defining the path to the extracted text file
local txtfile "cleaning/tempdata/INT_SCQ12_DEC03.txt"

* Deleting the file "INT_SCQ12_DEC03.txt" from the current directory
erase "INT_SCQ12_DEC03.txt" 

* Reading the fixed-width file using infix
infix ///
str3 CNT   1-  3 ///
str7 SUBNATIO   4- 10 ///
str7 STRATUM  11- 17 ///
OECD  18- 18 ///
str6 NC  19- 24 ///
str7 SCHOOLID  25- 31 ///
SC01Q01  32- 32 ///
SC02Q01  33- 41 ///
SC02Q02  42- 50 ///
SC02Q03  51- 59 ///
SC02Q04  60- 68 ///
SC03Q01  69- 69 ///
SC04Q01  70- 70 ///
str2 SC05Q01  71- 72 ///
SC07Q01  73- 81 ///
SC07Q02  82- 90 ///
SC09Q11  91- 94 ///
SC09Q12  95- 98 ///
SC09Q21  99-102 ///
SC09Q22 103-106 ///
SC09Q31 107-110 ///
SC09Q32 111-114 ///
SC10Q11 115-118 ///
SC10Q12 119-122 ///
SC10Q61 123-126 ///
SC10Q62 127-130 ///
SC10Q21 131-134 ///
SC10Q22 135-138 ///
SC10Q41 139-142 ///
SC10Q42 143-146 ///
SC10Q51 147-150 ///
SC10Q52 151-154 ///
SC11Q01 155-158 ///
SC11Q02 159-162 ///
SC11Q03 163-166 ///
SC13Q01 167-167 ///
SC13Q02 168-168 ///
SC13Q03 169-169 ///
SC14Q01 170-170 ///
SC14Q02 171-171 ///
SC14Q03 172-172 ///
SC14Q04 173-173 ///
SC14Q05 174-174 ///
SC14Q06 175-175 ///
SC14Q07 176-176 ///
SC14Q08 177-177 ///
SC14Q09 178-178 ///
SC14Q10 179-179 ///
SC14Q11 180-180 ///
SC14Q12 181-181 ///
SC14Q13 182-182 ///
SC15Q01 183-183 ///
SC15Q02 184-184 ///
SC15Q03 185-185 ///
SC15Q04 186-186 ///
SC16Q01 187-187 ///
SC16Q02 188-188 ///
SC16Q03 189-189 ///
SC16Q04 190-190 ///
SC16Q05 191-191 ///
SC16Q06 192-192 ///
SC16Q07 193-193 ///
SC16Q08 194-194 ///
SC16Q09 195-195 ///
SC16Q10 196-196 ///
SC16Q11 197-197 ///
SC18Q01 198-198 ///
SC18Q02 199-199 ///
SC18Q03 200-200 ///
SC18Q04 201-201 ///
SC18Q05 202-202 ///
SC18Q06 203-203 ///
SC18Q07 204-204 ///
SC18Q08 205-205 ///
SC19Q01 206-206 ///
SC19Q02 207-207 ///
SC20Q01 208-208 ///
SC21Q05 209-209 ///
SC22Q01 210-210 ///
SC22Q02 211-211 ///
SC22Q03 212-212 ///
SC22Q04 213-213 ///
SC22Q05 214-214 ///
SC22Q06 215-215 ///
SC22Q07 216-216 ///
SC22Q08 217-217 ///
SC22Q09 218-218 ///
SC22Q10 219-219 ///
SC22Q11 220-220 ///
SC22Q12 221-221 ///
SC22Q13 222-222 ///
SC22Q14 223-223 ///
SC22Q15 224-224 ///
SC22Q16 225-225 ///
SC22Q17 226-226 ///
SC22Q18 227-227 ///
SC22Q19 228-228 ///
SC23Q01 229-237 ///
SC24Q01 238-238 ///
SC25Q01 239-247 ///
SC25Q02 248-256 ///
SC25Q03 257-265 ///
SC25Q04 266-274 ///
SC25Q05 275-283 ///
SC25Q06 284-292 ///
SC25Q07 293-301 ///
SC25Q08 302-310 ///
SC25Q09 311-319 ///
SC25Q10 320-328 ///
SC25Q11 329-337 ///
SC25Q12 338-346 ///
SC26Q01 347-347 ///
SC26Q02 348-348 ///
SC26Q03 349-349 ///
SC26Q04 350-350 ///
SC27Q01 351-351 ///
SC27Q02 352-352 ///
SC28Q01 353-353 ///
SC28Q02 354-354 ///
SC29Q01 355-355 ///
SC29Q02 356-356 ///
SC30Q01 357-357 ///
SC30Q02 358-358 ///
SC30Q03 359-359 ///
SC30Q04 360-360 ///
SC31Q01 361-361 ///
SC31Q02 362-362 ///
SC31Q03 363-363 ///
SC31Q04 364-364 ///
SC31Q05 365-365 ///
SC31Q06 366-366 ///
SC31Q07 367-367 ///
SC32Q01 368-368 ///
SC32Q03 369-369 ///
SC32Q04 370-370 ///
SC32Q05 371-371 ///
SC32Q06 372-372 ///
SC32Q07 373-373 ///
SC32Q08 374-374 ///
SC33Q01A 375-375 ///
SC33Q01B 376-376 ///
SC33Q01C 377-377 ///
SC33Q01D 378-378 ///
SC33Q01E 379-379 ///
SC33Q02A 380-380 ///
SC33Q02B 381-381 ///
SC33Q02C 382-382 ///
SC33Q02D 383-383 ///
SC33Q02E 384-384 ///
SC33Q03A 385-385 ///
SC33Q03B 386-386 ///
SC33Q03C 387-387 ///
SC33Q03D 388-388 ///
SC33Q03E 389-389 ///
SC33Q04A 390-390 ///
SC33Q04B 391-391 ///
SC33Q04C 392-392 ///
SC33Q04D 393-393 ///
SC33Q04E 394-394 ///
SC33Q05A 395-395 ///
SC33Q05B 396-396 ///
SC33Q05C 397-397 ///
SC33Q05D 398-398 ///
SC33Q05E 399-399 ///
SC33Q06A 400-400 ///
SC33Q06B 401-401 ///
SC33Q06C 402-402 ///
SC33Q06D 403-403 ///
SC33Q06E 404-404 ///
SC33Q07A 405-405 ///
SC33Q07B 406-406 ///
SC33Q07C 407-407 ///
SC33Q07D 408-408 ///
SC33Q07E 409-409 ///
SC33Q08A 410-410 ///
SC33Q08B 411-411 ///
SC33Q08C 412-412 ///
SC33Q08D 413-413 ///
SC33Q08E 414-414 ///
SC33Q09A 415-415 ///
SC33Q09B 416-416 ///
SC33Q09C 417-417 ///
SC33Q09D 418-418 ///
SC33Q09E 419-419 ///
SC33Q10A 420-420 ///
SC33Q10B 421-421 ///
SC33Q10C 422-422 ///
SC33Q10D 423-423 ///
SC33Q10E 424-424 ///
SC33Q11A 425-425 ///
SC33Q11B 426-426 ///
SC33Q11C 427-427 ///
SC33Q11D 428-428 ///
SC33Q11E 429-429 ///
SC33Q12A 430-430 ///
SC33Q12B 431-431 ///
SC33Q12C 432-432 ///
SC33Q12D 433-433 ///
SC33Q12E 434-434 ///
SC34Q01 435-435 ///
SC34Q02 436-436 ///
SC34Q03 437-437 ///
SC34Q04 438-438 ///
SC34Q05 439-439 ///
SC34Q06 440-440 ///
SC34Q07 441-441 ///
SC34Q08 442-442 ///
SC34Q09 443-443 ///
SC34Q10 444-444 ///
SC34Q11 445-445 ///
SC34Q12 446-446 ///
SC34Q13 447-447 ///
SC34Q14 448-448 ///
SC34Q15 449-449 ///
SC34Q16 450-450 ///
SC34Q17 451-451 ///
SC34Q18 452-452 ///
SC34Q19 453-453 ///
SC34Q20 454-454 ///
SC34Q22 455-455 ///
SC35Q01 456-464 ///
SC35Q02 465-473 ///
SC39Q01 474-474 ///
SC39Q02 475-475 ///
SC39Q03 476-476 ///
SC39Q05 477-477 ///
SC39Q06 478-478 ///
SC39Q07 479-479 ///
SC39Q08 480-480 ///
SC39Q09 481-481 ///
SC39Q10 482-482 ///
SC40Q01 483-483 ///
SC40Q02 484-484 ///
SC40Q03 485-485 ///
SC44Q01 486-486 ///
SC44Q02 487-487 ///
SC44Q03 488-488 ///
SC44Q04 489-489 ///
SC44Q05 490-490 ///
SC44Q06 491-491 ///
SC47Q01 492-492 ///
SC45Q01 493-493 ///
SC46Q01 494-494 ///
SC46Q02 495-495 ///
SC46Q03 496-496 ///
SC46Q05 497-497 ///
SC46Q04 498-498 ///
SC46Q06 499-499 ///
SC46Q09 500-500 ///
SC52Q01 501-501 ///
SC46Q07 502-502 ///
SC46Q08 503-503 ///
SC52Q02 504-504 ///
SC51Q01 505-513 ///
SC51Q02 514-522 ///
ABGMATH 523-523 ///
ASSESS 524-524 ///
CLSIZE 525-526 ///
COMPWEB 527-535 ///
CREACTIV 536-536 ///
LEADCOM 537-545 ///
LEADINST 546-554 ///
LEADPD 555-563 ///
LEADTCH 564-572 ///
MACTIV 573-573 ///
MATHEXC 574-574 ///
PCGIRLS 575-583 ///
PROPCERT 584-592 ///
PROPMA5A 593-601 ///
PROPMATH 602-610 ///
PROPQUAL 611-619 ///
RATCMP15 620-628 ///
RESPCUR 629-636 ///
RESPRES 637-644 ///
SCHAUTON 645-653 ///
SCHLTYPE 654-654 ///
SCHSEL 655-655 ///
SCHSIZE 656-663 ///
SCMATBUI 664-672 ///
SCMATEDU 673-681 ///
SMRATIO 682-690 ///
STRATIO 691-699 ///
STUDCLIM 700-708 ///
TCFOCST 709-717 ///
TCHPARTI 718-726 ///
TCMORALE 727-735 ///
TCSHORT 736-744 ///
TEACCLIM 745-753 ///
W_FSCHWT 754-762 ///
SENWGT_SCQ 763-771 ///
str7 VER_SCQ 772-778 ///
using `txtfile', clear


* Dealing with missing valuesreplace NC = "" if NC == "777777" | NC == "888888" | NC == "999997" | NC == "999998" | NC == "999999"
replace SC05Q01 = "" if SC05Q01 == "96" | SC05Q01 == "97" | SC05Q01 == "98" | SC05Q01 == "99"
replace ABGMATH = . if ABGMATH == 7 | ABGMATH == 8 | ABGMATH == 9
replace ASSESS = . if ASSESS == 7 | ASSESS == 8 | ASSESS == 9
replace CLSIZE = . if CLSIZE == 96 | CLSIZE == 97 | CLSIZE == 98 | CLSIZE == 99
replace COMPWEB = . if COMPWEB == 9997 | COMPWEB == 9998 | COMPWEB == 9999
replace CREACTIV = . if CREACTIV == 7 | CREACTIV == 8 | CREACTIV == 9
replace W_FSCHWT = . if W_FSCHWT == 9997 | W_FSCHWT == 9998 | W_FSCHWT == 9999
replace SENWGT_SCQ = . if SENWGT_SCQ == 9997 | SENWGT_SCQ == 9998 | SENWGT_SCQ == 9999
replace LEADCOM = . if LEADCOM == 9997 | LEADCOM == 9998 | LEADCOM == 9999
replace LEADINST = . if LEADINST == 9997 | LEADINST == 9998 | LEADINST == 9999
replace LEADPD = . if LEADPD == 9997 | LEADPD == 9998 | LEADPD == 9999
replace LEADTCH = . if LEADTCH == 9997 | LEADTCH == 9998 | LEADTCH == 9999
replace MACTIV = . if MACTIV == 7 | MACTIV == 8 | MACTIV == 9
replace MATHEXC = . if MATHEXC == 7 | MATHEXC == 8 | MATHEXC == 9
replace PCGIRLS = . if PCGIRLS == 9997 | PCGIRLS == 9998 | PCGIRLS == 9999
replace PROPCERT = . if PROPCERT == 9997 | PROPCERT == 9998 | PROPCERT == 9999
replace PROPMA5A = . if PROPMA5A == 9997 | PROPMA5A == 9998 | PROPMA5A == 9999
replace PROPMATH = . if PROPMATH == 9997 | PROPMATH == 9998 | PROPMATH == 9999
replace PROPQUAL = . if PROPQUAL == 9997 | PROPQUAL == 9998 | PROPQUAL == 9999
replace RATCMP15 = . if RATCMP15 == 9997 | RATCMP15 == 9998 | RATCMP15 == 9999
replace RESPCUR = . if RESPCUR == 7 | RESPCUR == 8 | RESPCUR == 9
replace RESPRES = . if RESPRES == 7 | RESPRES == 8 | RESPRES == 9
replace SC01Q01 = . if SC01Q01 == 7 | SC01Q01 == 8 | SC01Q01 == 9
replace SC02Q01 = . if SC02Q01 == 9997 | SC02Q01 == 9998 | SC02Q01 == 9999
replace SC02Q02 = . if SC02Q02 == 9997 | SC02Q02 == 9998 | SC02Q02 == 9999
replace SC02Q03 = . if SC02Q03 == 9997 | SC02Q03 == 9998 | SC02Q03 == 9999
replace SC02Q04 = . if SC02Q04 == 9997 | SC02Q04 == 9998 | SC02Q04 == 9999
replace SC03Q01 = . if SC03Q01 == 7 | SC03Q01 == 8 | SC03Q01 == 9
replace SC04Q01 = . if SC04Q01 == 7 | SC04Q01 == 8 | SC04Q01 == 9
replace SC07Q01 = . if SC07Q01 == 9997 | SC07Q01 == 9998 | SC07Q01 == 9999
replace SC07Q02 = . if SC07Q02 == 9997 | SC07Q02 == 9998 | SC07Q02 == 9999
replace SC09Q11 = . if SC09Q11 == 9997 | SC09Q11 == 9998 | SC09Q11 == 9999
replace SC09Q12 = . if SC09Q12 == 9997 | SC09Q12 == 9998 | SC09Q12 == 9999
replace SC09Q21 = . if SC09Q21 == 9997 | SC09Q21 == 9998 | SC09Q21 == 9999
replace SC09Q22 = . if SC09Q22 == 9997 | SC09Q22 == 9998 | SC09Q22 == 9999
replace SC09Q31 = . if SC09Q31 == 9997 | SC09Q31 == 9998 | SC09Q31 == 9999
replace SC09Q32 = . if SC09Q32 == 9997 | SC09Q32 == 9998 | SC09Q32 == 9999
replace SC10Q11 = . if SC10Q11 == 9997 | SC10Q11 == 9998 | SC10Q11 == 9999
replace SC10Q12 = . if SC10Q12 == 9997 | SC10Q12 == 9998 | SC10Q12 == 9999
replace SC10Q21 = . if SC10Q21 == 9997 | SC10Q21 == 9998 | SC10Q21 == 9999
replace SC10Q22 = . if SC10Q22 == 9997 | SC10Q22 == 9998 | SC10Q22 == 9999
replace SC10Q41 = . if SC10Q41 == 9997 | SC10Q41 == 9998 | SC10Q41 == 9999
replace SC10Q42 = . if SC10Q42 == 9997 | SC10Q42 == 9998 | SC10Q42 == 9999
replace SC10Q51 = . if SC10Q51 == 9997 | SC10Q51 == 9998 | SC10Q51 == 9999
replace SC10Q52 = . if SC10Q52 == 9997 | SC10Q52 == 9998 | SC10Q52 == 9999
replace SC10Q61 = . if SC10Q61 == 9997 | SC10Q61 == 9998 | SC10Q61 == 9999
replace SC10Q62 = . if SC10Q62 == 9997 | SC10Q62 == 9998 | SC10Q62 == 9999
replace SC11Q01 = . if SC11Q01 == 9997 | SC11Q01 == 9998 | SC11Q01 == 9999
replace SC11Q02 = . if SC11Q02 == 9997 | SC11Q02 == 9998 | SC11Q02 == 9999
replace SC11Q03 = . if SC11Q03 == 9997 | SC11Q03 == 9998 | SC11Q03 == 9999
replace SC13Q01 = . if SC13Q01 == 7 | SC13Q01 == 8 | SC13Q01 == 9
replace SC13Q02 = . if SC13Q02 == 7 | SC13Q02 == 8 | SC13Q02 == 9
replace SC13Q03 = . if SC13Q03 == 7 | SC13Q03 == 8 | SC13Q03 == 9
replace SC14Q01 = . if SC14Q01 == 7 | SC14Q01 == 8 | SC14Q01 == 9
replace SC14Q02 = . if SC14Q02 == 7 | SC14Q02 == 8 | SC14Q02 == 9
replace SC14Q03 = . if SC14Q03 == 7 | SC14Q03 == 8 | SC14Q03 == 9
replace SC14Q04 = . if SC14Q04 == 7 | SC14Q04 == 8 | SC14Q04 == 9
replace SC14Q05 = . if SC14Q05 == 7 | SC14Q05 == 8 | SC14Q05 == 9
replace SC14Q06 = . if SC14Q06 == 7 | SC14Q06 == 8 | SC14Q06 == 9
replace SC14Q07 = . if SC14Q07 == 7 | SC14Q07 == 8 | SC14Q07 == 9
replace SC14Q08 = . if SC14Q08 == 7 | SC14Q08 == 8 | SC14Q08 == 9
replace SC14Q09 = . if SC14Q09 == 7 | SC14Q09 == 8 | SC14Q09 == 9
replace SC14Q10 = . if SC14Q10 == 7 | SC14Q10 == 8 | SC14Q10 == 9
replace SC14Q11 = . if SC14Q11 == 7 | SC14Q11 == 8 | SC14Q11 == 9
replace SC14Q12 = . if SC14Q12 == 7 | SC14Q12 == 8 | SC14Q12 == 9
replace SC14Q13 = . if SC14Q13 == 7 | SC14Q13 == 8 | SC14Q13 == 9
replace SC15Q01 = . if SC15Q01 == 7 | SC15Q01 == 8 | SC15Q01 == 9
replace SC15Q02 = . if SC15Q02 == 7 | SC15Q02 == 8 | SC15Q02 == 9
replace SC15Q03 = . if SC15Q03 == 7 | SC15Q03 == 8 | SC15Q03 == 9
replace SC15Q04 = . if SC15Q04 == 7 | SC15Q04 == 8 | SC15Q04 == 9
replace SC16Q01 = . if SC16Q01 == 7 | SC16Q01 == 8 | SC16Q01 == 9
replace SC16Q02 = . if SC16Q02 == 7 | SC16Q02 == 8 | SC16Q02 == 9
replace SC16Q03 = . if SC16Q03 == 7 | SC16Q03 == 8 | SC16Q03 == 9
replace SC16Q04 = . if SC16Q04 == 7 | SC16Q04 == 8 | SC16Q04 == 9
replace SC16Q05 = . if SC16Q05 == 7 | SC16Q05 == 8 | SC16Q05 == 9
replace SC16Q06 = . if SC16Q06 == 7 | SC16Q06 == 8 | SC16Q06 == 9
replace SC16Q07 = . if SC16Q07 == 7 | SC16Q07 == 8 | SC16Q07 == 9
replace SC16Q08 = . if SC16Q08 == 7 | SC16Q08 == 8 | SC16Q08 == 9
replace SC16Q09 = . if SC16Q09 == 7 | SC16Q09 == 8 | SC16Q09 == 9
replace SC16Q10 = . if SC16Q10 == 7 | SC16Q10 == 8 | SC16Q10 == 9
replace SC16Q11 = . if SC16Q11 == 7 | SC16Q11 == 8 | SC16Q11 == 9
replace SC18Q01 = . if SC18Q01 == 7 | SC18Q01 == 8 | SC18Q01 == 9
replace SC18Q02 = . if SC18Q02 == 7 | SC18Q02 == 8 | SC18Q02 == 9
replace SC18Q03 = . if SC18Q03 == 7 | SC18Q03 == 8 | SC18Q03 == 9
replace SC18Q04 = . if SC18Q04 == 7 | SC18Q04 == 8 | SC18Q04 == 9
replace SC18Q05 = . if SC18Q05 == 7 | SC18Q05 == 8 | SC18Q05 == 9
replace SC18Q06 = . if SC18Q06 == 7 | SC18Q06 == 8 | SC18Q06 == 9
replace SC18Q07 = . if SC18Q07 == 7 | SC18Q07 == 8 | SC18Q07 == 9
replace SC18Q08 = . if SC18Q08 == 7 | SC18Q08 == 8 | SC18Q08 == 9
replace SC19Q01 = . if SC19Q01 == 7 | SC19Q01 == 8 | SC19Q01 == 9
replace SC19Q02 = . if SC19Q02 == 7 | SC19Q02 == 8 | SC19Q02 == 9
replace SC20Q01 = . if SC20Q01 == 7 | SC20Q01 == 8 | SC20Q01 == 9
replace SC21Q05 = . if SC21Q05 == 7 | SC21Q05 == 8 | SC21Q05 == 9
replace SC22Q01 = . if SC22Q01 == 7 | SC22Q01 == 8 | SC22Q01 == 9
replace SC22Q02 = . if SC22Q02 == 7 | SC22Q02 == 8 | SC22Q02 == 9
replace SC22Q03 = . if SC22Q03 == 7 | SC22Q03 == 8 | SC22Q03 == 9
replace SC22Q04 = . if SC22Q04 == 7 | SC22Q04 == 8 | SC22Q04 == 9
replace SC22Q05 = . if SC22Q05 == 7 | SC22Q05 == 8 | SC22Q05 == 9
replace SC22Q06 = . if SC22Q06 == 7 | SC22Q06 == 8 | SC22Q06 == 9
replace SC22Q07 = . if SC22Q07 == 7 | SC22Q07 == 8 | SC22Q07 == 9
replace SC22Q08 = . if SC22Q08 == 7 | SC22Q08 == 8 | SC22Q08 == 9
replace SC22Q09 = . if SC22Q09 == 7 | SC22Q09 == 8 | SC22Q09 == 9
replace SC22Q10 = . if SC22Q10 == 7 | SC22Q10 == 8 | SC22Q10 == 9
replace SC22Q11 = . if SC22Q11 == 7 | SC22Q11 == 8 | SC22Q11 == 9
replace SC22Q12 = . if SC22Q12 == 7 | SC22Q12 == 8 | SC22Q12 == 9
replace SC22Q13 = . if SC22Q13 == 7 | SC22Q13 == 8 | SC22Q13 == 9
replace SC22Q14 = . if SC22Q14 == 7 | SC22Q14 == 8 | SC22Q14 == 9
replace SC22Q15 = . if SC22Q15 == 7 | SC22Q15 == 8 | SC22Q15 == 9
replace SC22Q16 = . if SC22Q16 == 7 | SC22Q16 == 8 | SC22Q16 == 9
replace SC22Q17 = . if SC22Q17 == 7 | SC22Q17 == 8 | SC22Q17 == 9
replace SC22Q18 = . if SC22Q18 == 7 | SC22Q18 == 8 | SC22Q18 == 9
replace SC22Q19 = . if SC22Q19 == 7 | SC22Q19 == 8 | SC22Q19 == 9
replace SC23Q01 = . if SC23Q01 == 9997 | SC23Q01 == 9998 | SC23Q01 == 9999
replace SC24Q01 = . if SC24Q01 == 7 | SC24Q01 == 8 | SC24Q01 == 9
replace SC25Q01 = . if SC25Q01 == 9997 | SC25Q01 == 9998 | SC25Q01 == 9999
replace SC25Q02 = . if SC25Q02 == 9997 | SC25Q02 == 9998 | SC25Q02 == 9999
replace SC25Q03 = . if SC25Q03 == 9997 | SC25Q03 == 9998 | SC25Q03 == 9999
replace SC25Q04 = . if SC25Q04 == 9997 | SC25Q04 == 9998 | SC25Q04 == 9999
replace SC25Q05 = . if SC25Q05 == 9997 | SC25Q05 == 9998 | SC25Q05 == 9999
replace SC25Q06 = . if SC25Q06 == 9997 | SC25Q06 == 9998 | SC25Q06 == 9999
replace SC25Q07 = . if SC25Q07 == 9997 | SC25Q07 == 9998 | SC25Q07 == 9999
replace SC25Q08 = . if SC25Q08 == 9997 | SC25Q08 == 9998 | SC25Q08 == 9999
replace SC25Q09 = . if SC25Q09 == 9997 | SC25Q09 == 9998 | SC25Q09 == 9999
replace SC25Q10 = . if SC25Q10 == 9997 | SC25Q10 == 9998 | SC25Q10 == 9999
replace SC25Q11 = . if SC25Q11 == 9997 | SC25Q11 == 9998 | SC25Q11 == 9999
replace SC25Q12 = . if SC25Q12 == 9997 | SC25Q12 == 9998 | SC25Q12 == 9999
replace SC26Q01 = . if SC26Q01 == 7 | SC26Q01 == 8 | SC26Q01 == 9
replace SC26Q02 = . if SC26Q02 == 7 | SC26Q02 == 8 | SC26Q02 == 9
replace SC26Q03 = . if SC26Q03 == 7 | SC26Q03 == 8 | SC26Q03 == 9
replace SC26Q04 = . if SC26Q04 == 7 | SC26Q04 == 8 | SC26Q04 == 9
replace SC27Q01 = . if SC27Q01 == 7 | SC27Q01 == 8 | SC27Q01 == 9
replace SC27Q02 = . if SC27Q02 == 7 | SC27Q02 == 8 | SC27Q02 == 9
replace SC28Q01 = . if SC28Q01 == 7 | SC28Q01 == 8 | SC28Q01 == 9
replace SC28Q02 = . if SC28Q02 == 7 | SC28Q02 == 8 | SC28Q02 == 9
replace SC29Q01 = . if SC29Q01 == 7 | SC29Q01 == 8 | SC29Q01 == 9
replace SC29Q02 = . if SC29Q02 == 7 | SC29Q02 == 8 | SC29Q02 == 9
replace SC30Q01 = . if SC30Q01 == 7 | SC30Q01 == 8 | SC30Q01 == 9
replace SC30Q02 = . if SC30Q02 == 7 | SC30Q02 == 8 | SC30Q02 == 9
replace SC30Q03 = . if SC30Q03 == 7 | SC30Q03 == 8 | SC30Q03 == 9
replace SC30Q04 = . if SC30Q04 == 7 | SC30Q04 == 8 | SC30Q04 == 9
replace SC31Q01 = . if SC31Q01 == 7 | SC31Q01 == 8 | SC31Q01 == 9
replace SC31Q02 = . if SC31Q02 == 7 | SC31Q02 == 8 | SC31Q02 == 9
replace SC31Q03 = . if SC31Q03 == 7 | SC31Q03 == 8 | SC31Q03 == 9
replace SC31Q04 = . if SC31Q04 == 7 | SC31Q04 == 8 | SC31Q04 == 9
replace SC31Q05 = . if SC31Q05 == 7 | SC31Q05 == 8 | SC31Q05 == 9
replace SC31Q06 = . if SC31Q06 == 7 | SC31Q06 == 8 | SC31Q06 == 9
replace SC31Q07 = . if SC31Q07 == 7 | SC31Q07 == 8 | SC31Q07 == 9
replace SC32Q01 = . if SC32Q01 == 7 | SC32Q01 == 8 | SC32Q01 == 9
replace SC32Q03 = . if SC32Q03 == 7 | SC32Q03 == 8 | SC32Q03 == 9
replace SC32Q04 = . if SC32Q04 == 7 | SC32Q04 == 8 | SC32Q04 == 9
replace SC32Q05 = . if SC32Q05 == 7 | SC32Q05 == 8 | SC32Q05 == 9
replace SC32Q06 = . if SC32Q06 == 7 | SC32Q06 == 8 | SC32Q06 == 9
replace SC32Q07 = . if SC32Q07 == 7 | SC32Q07 == 8 | SC32Q07 == 9
replace SC32Q08 = . if SC32Q08 == 7 | SC32Q08 == 8 | SC32Q08 == 9
replace SC33Q01A = . if SC33Q01A == 7 | SC33Q01A == 8 | SC33Q01A == 9
replace SC33Q01B = . if SC33Q01B == 7 | SC33Q01B == 8 | SC33Q01B == 9
replace SC33Q01C = . if SC33Q01C == 7 | SC33Q01C == 8 | SC33Q01C == 9
replace SC33Q01D = . if SC33Q01D == 7 | SC33Q01D == 8 | SC33Q01D == 9
replace SC33Q01E = . if SC33Q01E == 7 | SC33Q01E == 8 | SC33Q01E == 9
replace SC33Q02A = . if SC33Q02A == 7 | SC33Q02A == 8 | SC33Q02A == 9
replace SC33Q02B = . if SC33Q02B == 7 | SC33Q02B == 8 | SC33Q02B == 9
replace SC33Q02C = . if SC33Q02C == 7 | SC33Q02C == 8 | SC33Q02C == 9
replace SC33Q02D = . if SC33Q02D == 7 | SC33Q02D == 8 | SC33Q02D == 9
replace SC33Q02E = . if SC33Q02E == 7 | SC33Q02E == 8 | SC33Q02E == 9
replace SC33Q03A = . if SC33Q03A == 7 | SC33Q03A == 8 | SC33Q03A == 9
replace SC33Q03B = . if SC33Q03B == 7 | SC33Q03B == 8 | SC33Q03B == 9
replace SC33Q03C = . if SC33Q03C == 7 | SC33Q03C == 8 | SC33Q03C == 9
replace SC33Q03D = . if SC33Q03D == 7 | SC33Q03D == 8 | SC33Q03D == 9
replace SC33Q03E = . if SC33Q03E == 7 | SC33Q03E == 8 | SC33Q03E == 9
replace SC33Q04A = . if SC33Q04A == 7 | SC33Q04A == 8 | SC33Q04A == 9
replace SC33Q04B = . if SC33Q04B == 7 | SC33Q04B == 8 | SC33Q04B == 9
replace SC33Q04C = . if SC33Q04C == 7 | SC33Q04C == 8 | SC33Q04C == 9
replace SC33Q04D = . if SC33Q04D == 7 | SC33Q04D == 8 | SC33Q04D == 9
replace SC33Q04E = . if SC33Q04E == 7 | SC33Q04E == 8 | SC33Q04E == 9
replace SC33Q05A = . if SC33Q05A == 7 | SC33Q05A == 8 | SC33Q05A == 9
replace SC33Q05B = . if SC33Q05B == 7 | SC33Q05B == 8 | SC33Q05B == 9
replace SC33Q05C = . if SC33Q05C == 7 | SC33Q05C == 8 | SC33Q05C == 9
replace SC33Q05D = . if SC33Q05D == 7 | SC33Q05D == 8 | SC33Q05D == 9
replace SC33Q05E = . if SC33Q05E == 7 | SC33Q05E == 8 | SC33Q05E == 9
replace SC33Q06A = . if SC33Q06A == 7 | SC33Q06A == 8 | SC33Q06A == 9
replace SC33Q06B = . if SC33Q06B == 7 | SC33Q06B == 8 | SC33Q06B == 9
replace SC33Q06C = . if SC33Q06C == 7 | SC33Q06C == 8 | SC33Q06C == 9
replace SC33Q06D = . if SC33Q06D == 7 | SC33Q06D == 8 | SC33Q06D == 9
replace SC33Q06E = . if SC33Q06E == 7 | SC33Q06E == 8 | SC33Q06E == 9
replace SC33Q07A = . if SC33Q07A == 7 | SC33Q07A == 8 | SC33Q07A == 9
replace SC33Q07B = . if SC33Q07B == 7 | SC33Q07B == 8 | SC33Q07B == 9
replace SC33Q07C = . if SC33Q07C == 7 | SC33Q07C == 8 | SC33Q07C == 9
replace SC33Q07D = . if SC33Q07D == 7 | SC33Q07D == 8 | SC33Q07D == 9
replace SC33Q07E = . if SC33Q07E == 7 | SC33Q07E == 8 | SC33Q07E == 9
replace SC33Q08A = . if SC33Q08A == 7 | SC33Q08A == 8 | SC33Q08A == 9
replace SC33Q08B = . if SC33Q08B == 7 | SC33Q08B == 8 | SC33Q08B == 9
replace SC33Q08C = . if SC33Q08C == 7 | SC33Q08C == 8 | SC33Q08C == 9
replace SC33Q08D = . if SC33Q08D == 7 | SC33Q08D == 8 | SC33Q08D == 9
replace SC33Q08E = . if SC33Q08E == 7 | SC33Q08E == 8 | SC33Q08E == 9
replace SC33Q09A = . if SC33Q09A == 7 | SC33Q09A == 8 | SC33Q09A == 9
replace SC33Q09B = . if SC33Q09B == 7 | SC33Q09B == 8 | SC33Q09B == 9
replace SC33Q09C = . if SC33Q09C == 7 | SC33Q09C == 8 | SC33Q09C == 9
replace SC33Q09D = . if SC33Q09D == 7 | SC33Q09D == 8 | SC33Q09D == 9
replace SC33Q09E = . if SC33Q09E == 7 | SC33Q09E == 8 | SC33Q09E == 9
replace SC33Q10A = . if SC33Q10A == 7 | SC33Q10A == 8 | SC33Q10A == 9
replace SC33Q10B = . if SC33Q10B == 7 | SC33Q10B == 8 | SC33Q10B == 9
replace SC33Q10C = . if SC33Q10C == 7 | SC33Q10C == 8 | SC33Q10C == 9
replace SC33Q10D = . if SC33Q10D == 7 | SC33Q10D == 8 | SC33Q10D == 9
replace SC33Q10E = . if SC33Q10E == 7 | SC33Q10E == 8 | SC33Q10E == 9
replace SC33Q11A = . if SC33Q11A == 7 | SC33Q11A == 8 | SC33Q11A == 9
replace SC33Q11B = . if SC33Q11B == 7 | SC33Q11B == 8 | SC33Q11B == 9
replace SC33Q11C = . if SC33Q11C == 7 | SC33Q11C == 8 | SC33Q11C == 9
replace SC33Q11D = . if SC33Q11D == 7 | SC33Q11D == 8 | SC33Q11D == 9
replace SC33Q11E = . if SC33Q11E == 7 | SC33Q11E == 8 | SC33Q11E == 9
replace SC33Q12A = . if SC33Q12A == 7 | SC33Q12A == 8 | SC33Q12A == 9
replace SC33Q12B = . if SC33Q12B == 7 | SC33Q12B == 8 | SC33Q12B == 9
replace SC33Q12C = . if SC33Q12C == 7 | SC33Q12C == 8 | SC33Q12C == 9
replace SC33Q12D = . if SC33Q12D == 7 | SC33Q12D == 8 | SC33Q12D == 9
replace SC33Q12E = . if SC33Q12E == 7 | SC33Q12E == 8 | SC33Q12E == 9
replace SC34Q01 = . if SC34Q01 == 7 | SC34Q01 == 8 | SC34Q01 == 9
replace SC34Q02 = . if SC34Q02 == 7 | SC34Q02 == 8 | SC34Q02 == 9
replace SC34Q03 = . if SC34Q03 == 7 | SC34Q03 == 8 | SC34Q03 == 9
replace SC34Q04 = . if SC34Q04 == 7 | SC34Q04 == 8 | SC34Q04 == 9
replace SC34Q05 = . if SC34Q05 == 7 | SC34Q05 == 8 | SC34Q05 == 9
replace SC34Q06 = . if SC34Q06 == 7 | SC34Q06 == 8 | SC34Q06 == 9
replace SC34Q07 = . if SC34Q07 == 7 | SC34Q07 == 8 | SC34Q07 == 9
replace SC34Q08 = . if SC34Q08 == 7 | SC34Q08 == 8 | SC34Q08 == 9
replace SC34Q09 = . if SC34Q09 == 7 | SC34Q09 == 8 | SC34Q09 == 9
replace SC34Q10 = . if SC34Q10 == 7 | SC34Q10 == 8 | SC34Q10 == 9
replace SC34Q11 = . if SC34Q11 == 7 | SC34Q11 == 8 | SC34Q11 == 9
replace SC34Q12 = . if SC34Q12 == 7 | SC34Q12 == 8 | SC34Q12 == 9
replace SC34Q13 = . if SC34Q13 == 7 | SC34Q13 == 8 | SC34Q13 == 9
replace SC34Q14 = . if SC34Q14 == 7 | SC34Q14 == 8 | SC34Q14 == 9
replace SC34Q15 = . if SC34Q15 == 7 | SC34Q15 == 8 | SC34Q15 == 9
replace SC34Q16 = . if SC34Q16 == 7 | SC34Q16 == 8 | SC34Q16 == 9
replace SC34Q17 = . if SC34Q17 == 7 | SC34Q17 == 8 | SC34Q17 == 9
replace SC34Q18 = . if SC34Q18 == 7 | SC34Q18 == 8 | SC34Q18 == 9
replace SC34Q19 = . if SC34Q19 == 7 | SC34Q19 == 8 | SC34Q19 == 9
replace SC34Q20 = . if SC34Q20 == 7 | SC34Q20 == 8 | SC34Q20 == 9
replace SC34Q22 = . if SC34Q22 == 7 | SC34Q22 == 8 | SC34Q22 == 9
replace SC35Q01 = . if SC35Q01 == 9997 | SC35Q01 == 9998 | SC35Q01 == 9999
replace SC35Q02 = . if SC35Q02 == 9997 | SC35Q02 == 9998 | SC35Q02 == 9999
replace SC39Q01 = . if SC39Q01 == 7 | SC39Q01 == 8 | SC39Q01 == 9
replace SC39Q02 = . if SC39Q02 == 7 | SC39Q02 == 8 | SC39Q02 == 9
replace SC39Q03 = . if SC39Q03 == 7 | SC39Q03 == 8 | SC39Q03 == 9
replace SC39Q05 = . if SC39Q05 == 7 | SC39Q05 == 8 | SC39Q05 == 9
replace SC39Q06 = . if SC39Q06 == 7 | SC39Q06 == 8 | SC39Q06 == 9
replace SC39Q07 = . if SC39Q07 == 7 | SC39Q07 == 8 | SC39Q07 == 9
replace SC39Q08 = . if SC39Q08 == 7 | SC39Q08 == 8 | SC39Q08 == 9
replace SC39Q09 = . if SC39Q09 == 7 | SC39Q09 == 8 | SC39Q09 == 9
replace SC39Q10 = . if SC39Q10 == 7 | SC39Q10 == 8 | SC39Q10 == 9
replace SC40Q01 = . if SC40Q01 == 7 | SC40Q01 == 8 | SC40Q01 == 9
replace SC40Q02 = . if SC40Q02 == 7 | SC40Q02 == 8 | SC40Q02 == 9
replace SC40Q03 = . if SC40Q03 == 7 | SC40Q03 == 8 | SC40Q03 == 9
replace SC44Q01 = . if SC44Q01 == 7 | SC44Q01 == 8 | SC44Q01 == 9
replace SC44Q02 = . if SC44Q02 == 7 | SC44Q02 == 8 | SC44Q02 == 9
replace SC44Q03 = . if SC44Q03 == 7 | SC44Q03 == 8 | SC44Q03 == 9
replace SC44Q04 = . if SC44Q04 == 7 | SC44Q04 == 8 | SC44Q04 == 9
replace SC44Q05 = . if SC44Q05 == 7 | SC44Q05 == 8 | SC44Q05 == 9
replace SC44Q06 = . if SC44Q06 == 7 | SC44Q06 == 8 | SC44Q06 == 9
replace SC45Q01 = . if SC45Q01 == 7 | SC45Q01 == 8 | SC45Q01 == 9
replace SC46Q01 = . if SC46Q01 == 7 | SC46Q01 == 8 | SC46Q01 == 9
replace SC46Q02 = . if SC46Q02 == 7 | SC46Q02 == 8 | SC46Q02 == 9
replace SC46Q03 = . if SC46Q03 == 7 | SC46Q03 == 8 | SC46Q03 == 9
replace SC46Q04 = . if SC46Q04 == 7 | SC46Q04 == 8 | SC46Q04 == 9
replace SC46Q05 = . if SC46Q05 == 7 | SC46Q05 == 8 | SC46Q05 == 9
replace SC46Q06 = . if SC46Q06 == 7 | SC46Q06 == 8 | SC46Q06 == 9
replace SC46Q07 = . if SC46Q07 == 7 | SC46Q07 == 8 | SC46Q07 == 9
replace SC46Q08 = . if SC46Q08 == 7 | SC46Q08 == 8 | SC46Q08 == 9
replace SC46Q09 = . if SC46Q09 == 7 | SC46Q09 == 8 | SC46Q09 == 9
replace SC47Q01 = . if SC47Q01 == 7 | SC47Q01 == 8 | SC47Q01 == 9
replace SC51Q01 = . if SC51Q01 == 9997 | SC51Q01 == 9998 | SC51Q01 == 9999
replace SC51Q02 = . if SC51Q02 == 9997 | SC51Q02 == 9998 | SC51Q02 == 9999
replace SC52Q01 = . if SC52Q01 == 7 | SC52Q01 == 8 | SC52Q01 == 9
replace SC52Q02 = . if SC52Q02 == 7 | SC52Q02 == 8 | SC52Q02 == 9
replace SCHAUTON = . if SCHAUTON == 9997 | SCHAUTON == 9998 | SCHAUTON == 9999
replace SCHLTYPE = . if SCHLTYPE == 7 | SCHLTYPE == 8 | SCHLTYPE == 9
replace SCHSEL = . if SCHSEL == 7 | SCHSEL == 8 | SCHSEL == 9
replace SCHSIZE = . if SCHSIZE == 99997 | SCHSIZE == 99998 | SCHSIZE == 99999
replace SCMATBUI = . if SCMATBUI == 9997 | SCMATBUI == 9998 | SCMATBUI == 9999
replace SCMATEDU = . if SCMATEDU == 9997 | SCMATEDU == 9998 | SCMATEDU == 9999
replace SMRATIO = . if SMRATIO == 9997 | SMRATIO == 9998 | SMRATIO == 9999
replace STRATIO = . if STRATIO == 9997 | STRATIO == 9998 | STRATIO == 9999
replace STUDCLIM = . if STUDCLIM == 9997 | STUDCLIM == 9998 | STUDCLIM == 9999
replace TCFOCST = . if TCFOCST == 9997 | TCFOCST == 9998 | TCFOCST == 9999
replace TCHPARTI = . if TCHPARTI == 9997 | TCHPARTI == 9998 | TCHPARTI == 9999
replace TCMORALE = . if TCMORALE == 9997 | TCMORALE == 9998 | TCMORALE == 9999
replace TCSHORT = . if TCSHORT == 9997 | TCSHORT == 9998 | TCSHORT == 9999
replace TEACCLIM = . if TEACCLIM == 9997 | TEACCLIM == 9998 | TEACCLIM == 9999


* Including variable labels 
label variable NC "National Centre 6-digit Code"
label variable CNT "Country code 3-character"
label variable OECD "OECD country"
label variable SUBNATIO "Adjudicated sub-region code 7-digit code (3-digit country code + region ID + stratum ID)"
label variable STRATUM "Stratum ID 7-character (cnt + region ID + original stratum ID)"
label variable SCHOOLID "School ID 7-digit (region ID + stratum ID + 3-digit school ID)"
label variable SC01Q01 "Public or private"
label variable SC02Q01 "Funding - Government"
label variable SC02Q02 "Funding - Student fees"
label variable SC02Q03 "Funding - Benefactors"
label variable SC02Q04 "Funding - Other"
label variable SC03Q01 "School Location"
label variable SC04Q01 "Competition between schools"
label variable SC05Q01 "Class size in <test language>"
label variable SC07Q01 "Enrolment - Number of boys"
label variable SC07Q02 "Enrolment - Number of girls"
label variable SC09Q11 "No. of teachers - Total Full Time"
label variable SC09Q12 "No. of teachers - Total Part time"
label variable SC09Q21 "No. of teachers - Certified Full Time"
label variable SC09Q22 "No. of teachers - Certified Part Time"
label variable SC09Q31 "No. of teachers - <ISCED5A> Qualified Full Time"
label variable SC09Q32 "No. of teachers - <ISCED5A> Qualified Part Time"
label variable SC10Q11 "No. of maths teachers - Total Full Time"
label variable SC10Q12 "No. of maths teachers - Total Part time"
label variable SC10Q21 "No. of maths teachers - <ISCED5A> Qual Maths Major Full Time"
label variable SC10Q22 "No. of maths teachers - <ISCED5A> Qual Maths Major Part Time"
label variable SC10Q41 "No. of maths teachers - <ISCED5A> Qual Pedagogy Full Time"
label variable SC10Q42 "No. of maths teachers - <ISCED5A> Qual Pedagogy Part Time"
label variable SC10Q51 "No. of maths teachers - <ISCED5B> Qual Full Time"
label variable SC10Q52 "No. of maths teachers - <ISCED5B> Qual Part Time"
label variable SC10Q61 "No. of maths teachers - <ISCED5A> Qual Full Time"
label variable SC10Q62 "No. of maths teachers - <ISCED5A> Qual Part Time"
label variable SC11Q01 "Student Computers - Total number of students in the <national modal grade for 15-year-olds>"
label variable SC11Q02 "Student Computers - Computers for Education"
label variable SC11Q03 "Student Computers - Computers with Internet"
label variable SC13Q01 "Internet schoolwork - Lessons"
label variable SC13Q02 "Internet schoolwork - Homework"
label variable SC13Q03 "Internet schoolwork - Assignments"
label variable SC14Q01 "Shortage - Science teachers"
label variable SC14Q02 "Shortage - Maths teachers"
label variable SC14Q03 "Shortage - <Test language> teachers"
label variable SC14Q04 "Shortage - Other teachers"
label variable SC14Q05 "Shortage - Science lab equipment"
label variable SC14Q06 "Shortage - Instructional materials"
label variable SC14Q07 "Shortage - Computers for instruction"
label variable SC14Q08 "Shortage - Internet connectivity"
label variable SC14Q09 "Shortage - Computer software"
label variable SC14Q10 "Shortage - Library materials"
label variable SC14Q11 "Shortage - Buildings and grounds"
label variable SC14Q12 "Shortage - Heating/cooling and lighting"
label variable SC14Q13 "Shortage - Instructional space"
label variable SC15Q01 "Ability grouping - Similar content/different difficulty"
label variable SC15Q02 "Ability grouping - Different content/different difficulty"
label variable SC15Q03 "Ability grouping - Grouped by ability"
label variable SC15Q04 "Ability grouping - Not grouped by ability"
label variable SC16Q01 "Activities - Band"
label variable SC16Q02 "Activities - School play"
label variable SC16Q03 "Activities - Yearbook or newspaper"
label variable SC16Q04 "Activities - Volunteering"
label variable SC16Q05 "Activities - Mathematics club "
label variable SC16Q06 "Activities - Mathematics competitions"
label variable SC16Q07 "Activities - Chess club "
label variable SC16Q08 "Activities - Computer or ICT club"
label variable SC16Q09 "Activities - Art club"
label variable SC16Q10 "Activities - Sporting team"
label variable SC16Q11 "Activities - <country specific item> "
label variable SC18Q01 "Assessments  -  Child's Progress"
label variable SC18Q02 "Assessments  -  Student Promotion"
label variable SC18Q03 "Assessments  -  Instruction"
label variable SC18Q04 "Assessments  -  National Performance"
label variable SC18Q05 "Assessments  -  School's Progress"
label variable SC18Q06 "Assessments  -  Teachers"
label variable SC18Q07 "Assessments  -  Curriculum"
label variable SC18Q08 "Assessments  -  Other Schools"
label variable SC19Q01 "Achievement - Posted Publicly"
label variable SC19Q02 "Achievement - Tracked by Authority"
label variable SC20Q01 "Additional maths lessons"
label variable SC21Q05 "Purpose of additional maths lessons"
label variable SC22Q01 "Learning Hindrance - Students truancy"
label variable SC22Q02 "Learning Hindrance - Skipping classes"
label variable SC22Q03 "Learning Hindrance - Students being late"
label variable SC22Q04 "Learning Hindrance - Students skipping events"
label variable SC22Q05 "Learning Hindrance - Students lacking respect"
label variable SC22Q06 "Learning Hindrance - Students Disruption"
label variable SC22Q07 "Learning Hindrance - Students drug use"
label variable SC22Q08 "Learning Hindrance - Students being bullied"
label variable SC22Q09 "Learning Hindrance - Students not encouraged"
label variable SC22Q10 "Learning Hindrance - Poor student-teacher relations"
label variable SC22Q11 "Learning Hindrance - Heterogeneous classes"
label variable SC22Q12 "Learning Hindrance - Diverse ethnic backgrounds"
label variable SC22Q13 "Learning Hindrance - Teachers low expectations"
label variable SC22Q14 "Learning Hindrance - Students needs not met"
label variable SC22Q15 "Learning Hindrance - Teacher absenteeism"
label variable SC22Q16 "Learning Hindrance - Staff resisting change "
label variable SC22Q17 "Learning Hindrance - Teachers too strict"
label variable SC22Q18 "Learning Hindrance - Teachers being late"
label variable SC22Q19 "Learning Hindrance - Teachers being unprepared"
label variable SC23Q01 "Students leaving without certificate"
label variable SC24Q01 "Parental achievement pressure"
label variable SC25Q01 "Parent Participation - Behaviour discussion parent initiative"
label variable SC25Q02 "Parent Participation - Behaviour discussion teacher initiative"
label variable SC25Q03 "Parent Participation - Progress discussion parent initiative"
label variable SC25Q04 "Parent Participation - Progress discussion teacher initiative"
label variable SC25Q05 "Parent Participation - Assistance building and grounds"
label variable SC25Q06 "Parent Participation - Extra-curricular volunteering"
label variable SC25Q07 "Parent Participation - Library volunteering"
label variable SC25Q08 "Parent Participation - Teacher assistance"
label variable SC25Q09 "Parent Participation - Guest speaking"
label variable SC25Q10 "Parent Participation - School government"
label variable SC25Q11 "Parent Participation - Fundraising"
label variable SC25Q12 "Parent Pariticpation - <Canteen>"
label variable SC26Q01 "Teacher morale - High Morale"
label variable SC26Q02 "Teacher morale - Enthusiasm"
label variable SC26Q03 "Teacher morale - Pride"
label variable SC26Q04 "Teacher morale - Value achievement"
label variable SC27Q01 "Teacher intentions - Trying new methods"
label variable SC27Q02 "Teacher intentions - Stay with well-known methods"
label variable SC28Q01 "Teacher intentions - Maximise achievement"
label variable SC28Q02 "Teacher intentions - Adapt standards"
label variable SC29Q01 "Teacher intentions - Social development"
label variable SC29Q02 "Teacher intentions - Development of maths skills"
label variable SC30Q01 "Teacher Monitoring - Student Achievement tests"
label variable SC30Q02 "Teacher Monitoring - Teacher peer review"
label variable SC30Q03 "Teacher Monitoring - Principal or senior staff"
label variable SC30Q04 "Teacher Monitoring - External observers"
label variable SC31Q01 "Teacher Appraisal - Salary change"
label variable SC31Q02 "Teacher Appraisal - Financial bonus"
label variable SC31Q03 "Teacher Appraisal - Professional development"
label variable SC31Q04 "Teacher Appraisal - Career advancement"
label variable SC31Q05 "Teacher Appraisal - Public recognition"
label variable SC31Q06 "Teacher Appraisal - Work responsibilities"
label variable SC31Q07 "Teacher Appraisal - School development"
label variable SC32Q01 "Admission  -  Academic record"
label variable SC32Q03 "Admission  -  Feeder schools"
label variable SC32Q04 "Admission  -  Parents endorsement"
label variable SC32Q05 "Admission  -  Special Programme"
label variable SC32Q06 "Admission  -  Family members"
label variable SC32Q07 "Admission  -  Residence"
label variable SC32Q08 "Admission  -  Other"
label variable SC33Q01A "Responsibility - Hiring teachers - Principals"
label variable SC33Q01B "Responsibility - Hiring teachers - Teachers"
label variable SC33Q01C "Responsibility - Hiring teachers - <School governing board>"
label variable SC33Q01D "Responsibility - Hiring teachers - <Regional or local education authority>"
label variable SC33Q01E "Responsibility - Hiring teachers - National education authority"
label variable SC33Q02A "Responsibility - Firing teachers - Principals"
label variable SC33Q02B "Responsibility - Firing teachers - Teachers"
label variable SC33Q02C "Responsibility - Firing teachers - <School governing board>"
label variable SC33Q02D "Responsibility - Firing teachers - <Regional or local education authority>"
label variable SC33Q02E "Responsibility - Firing teachers - National education authority"
label variable SC33Q03A "Responsibility - Teacher start salaries - Principals"
label variable SC33Q03B "Responsibility - Teacher start salaries - Teachers"
label variable SC33Q03C "Responsibility - Teacher start salaries - <School governing board>"
label variable SC33Q03D "Responsibility - Teacher start salaries - <Regional or local education authority>"
label variable SC33Q03E "Responsibility - Teacher start salaries - National education authority"
label variable SC33Q04A "Responsibility - Salary increase - Principals"
label variable SC33Q04B "Responsibility - Salary increase - Teachers"
label variable SC33Q04C "Responsibility - Salary increase - <School governing board>"
label variable SC33Q04D "Responsibility - Salary increase - <Regional or local education authority>"
label variable SC33Q04E "Responsibility - Salary increase - National education authority"
label variable SC33Q05A "Responsibility - Budget formulation - Principals"
label variable SC33Q05B "Responsibility - Budget formulation - Teachers"
label variable SC33Q05C "Responsibility - Budget formulation - <School governing board>"
label variable SC33Q05D "Responsibility - Budget formulation - <Regional or local education authority>"
label variable SC33Q05E "Responsibility - Budget formulation - National education authority"
label variable SC33Q06A "Responsibility - Budget allocation - Principals"
label variable SC33Q06B "Responsibility - Budget allocation - Teachers"
label variable SC33Q06C "Responsibility - Budget allocation - <School governing board>"
label variable SC33Q06D "Responsibility - Budget allocation - <Regional or local education authority>"
label variable SC33Q06E "Responsibility - Budget allocation - National education authority"
label variable SC33Q07A "Responsibility - Disciplinary policies - Principals"
label variable SC33Q07B "Responsibility - Disciplinary policies - Teachers"
label variable SC33Q07C "Responsibility - Disciplinary policies - <School governing board>"
label variable SC33Q07D "Responsibility - Disciplinary policies - <Regional or local education authority>"
label variable SC33Q07E "Responsibility - Disciplinary policies - National education authority"
label variable SC33Q08A "Responsibility - Assessment policies - Principals"
label variable SC33Q08B "Responsibility - Assessment policies - Teachers"
label variable SC33Q08C "Responsibility - Assessment policies - <School governing board>"
label variable SC33Q08D "Responsibility - Assessment policies - <Regional or local education authority>"
label variable SC33Q08E "Responsibility - Assessment policies - National education authority"
label variable SC33Q09A "Responsibility - Student admittance - Principals"
label variable SC33Q09B "Responsibility - Student admittance - Teachers"
label variable SC33Q09C "Responsibility - Student admittance - <School governing board>"
label variable SC33Q09D "Responsibility - Student admittance - <Regional or local education authority>"
label variable SC33Q09E "Responsibility - Student admittance - National education authority"
label variable SC33Q10A "Responsibility - Textbook selection - Principals"
label variable SC33Q10B "Responsibility - Textbook selection - Teachers"
label variable SC33Q10C "Responsibility - Textbook selection - <School governing board>"
label variable SC33Q10D "Responsibility - Textbook selection - <Regional or local education authority>"
label variable SC33Q10E "Responsibility - Textbook selection - National education authority"
label variable SC33Q11A "Responsibility - Course content - Principals"
label variable SC33Q11B "Responsibility - Course content - Teachers"
label variable SC33Q11C "Responsibility - Course content - <School governing board>"
label variable SC33Q11D "Responsibility - Course content - <Regional or local education authority>"
label variable SC33Q11E "Responsibility - Course content - National education authority"
label variable SC33Q12A "Responsibility - Courses offered - Principals"
label variable SC33Q12B "Responsibility - Courses offered - Teachers"
label variable SC33Q12C "Responsibility - Courses offered - <School governing board>"
label variable SC33Q12D "Responsibility - Courses offered - <Regional or local education authority>"
label variable SC33Q12E "Responsibility - Courses offered - National education authority"
label variable SC34Q01 "School Leadership - Enhance reputation"
label variable SC34Q02 "School Leadership - Student results"
label variable SC34Q03 "School Leadership - Development activities"
label variable SC34Q04 "School Leadership - Educational goals"
label variable SC34Q05 "School Leadership - Educational research"
label variable SC34Q06 "School Leadership - Praise teacher learning"
label variable SC34Q07 "School Leadership - Discuss problems"
label variable SC34Q08 "School Leadership - Importance of social capacities"
label variable SC34Q09 "School Leadership - Disruptive behaviour"
label variable SC34Q10 "School Leadership - Staff decision making"
label variable SC34Q11 "School Leadership - Improvement culture"
label variable SC34Q12 "School Leadership - Reviewing management"
label variable SC34Q13 "School Leadership - Joint problem solving"
label variable SC34Q14 "School Leadership - Goal discussion"
label variable SC34Q15 "School Leadership - Goal-oriented curriculum"
label variable SC34Q16 "School Leadership - Curricular strengths"
label variable SC34Q17 "School Leadership - Inservice activities"
label variable SC34Q18 "School Leadership - Sharing ideas or information"
label variable SC34Q19 "School Leadership - Informal observations"
label variable SC34Q20 "School Leadership - Review student work"
label variable SC34Q22 "School Leadership - Evaluate staff"
label variable SC35Q01 "Maths Professional Development  - All staff"
label variable SC35Q02 "Maths Professional Development  - Maths teachers"
label variable SC39Q01 "Quality Assurance - Specification of profile"
label variable SC39Q02 "Quality Assurance - Specification of standards"
label variable SC39Q03 "Quality Assurance - Data recording"
label variable SC39Q05 "Quality Assurance - Internal evaluation"
label variable SC39Q06 "Quality Assurance - External evaluation "
label variable SC39Q07 "Quality Assurance - Student feed-back"
label variable SC39Q08 "Quality Assurance - Teacher mentoring "
label variable SC39Q09 "Quality Assurance - Expert consultation"
label variable SC39Q10 "Quality Assurance - Standardised maths policy"
label variable SC40Q01 "Maths Policy - Computer use"
label variable SC40Q02 "Maths Policy - Textbook"
label variable SC40Q03 "Maths Policy - Standardised curriculum"
label variable SC44Q01 "Student Transfer  -  Low achievement"
label variable SC44Q02 "Student Transfer  -  High achievement"
label variable SC44Q03 "Student Transfer  -  Behavioural problems"
label variable SC44Q04 "Student Transfer  -  Special learning needs"
label variable SC44Q05 "Student Transfer  -  Parents request"
label variable SC44Q06 "Transfer  -  other reasons"
label variable SC45Q01 "Compulsory FE"
label variable SC46Q01 "Teaching FE - Separate subject"
label variable SC46Q02 "Teaching FE - Cross-curricular subject"
label variable SC46Q03 "Teaching FE - Part of <business or economics> course"
label variable SC46Q04 "Teaching FE - Part of humanities subjects"
label variable SC46Q05 "Teaching FE - Part of mathematics"
label variable SC46Q06 "Teaching FE - Extra-curricular activity"
label variable SC46Q07 "Teaching FE - Private sector"
label variable SC46Q08 "Teaching FE - Public sector"
label variable SC46Q09 "Teaching FE - Class teacher lessons"
label variable SC47Q01 "Availability of FE"
label variable SC51Q01 "FE Professional development – FE Staff"
label variable SC51Q02 "FE Professional development – Non FE Staff"
label variable SC52Q01 "Teaching FE – Teachers"
label variable SC52Q02 "Teaching FE – NGO"
label variable ABGMATH "Ability grouping for mathematics classes"
label variable ASSESS "Use of assessment"
label variable CLSIZE "Class size"
label variable COMPWEB "Ratio of computers connected to WEB and number of computers"
label variable CREACTIV "Extracurricular creative activities at school"
label variable RATCMP15 "Ratio of computers for education and number of students in the <national modal grade for 15-year-olds>"
label variable LEADCOM "Framing and communicating the school’s goals and curricular development"
label variable LEADINST "Instructional Leadership"
label variable LEADPD "Promoting instructional improvements and professional development"
label variable LEADTCH "Teacher participation in leadership"
label variable MACTIV "Mathematics Extracurricular activities at school"
label variable MATHEXC "Mathematics extension course types offered"
label variable PCGIRLS "Proportion of girls at school"
label variable PROPCERT "Proportion of certified teachers"
label variable PROPMA5A "Proportion of maths teachers with ISCED 5A (maths major)"
label variable PROPMATH "Proportion of maths teachers"
label variable PROPQUAL "Proportion of teachers with ISCED 5A"
label variable RESPCUR "Index of school responsibility for curriculum and assessment"
label variable RESPRES "Index of school responsibility for resource allocation"
label variable SCHAUTON "School Autonomy"
label variable SCHLTYPE "School Ownership"
label variable SCHSEL "School selectivity/student admission policies"
label variable SCHSIZE "Total school enrolment"
label variable SCMATBUI "Quality of physical infrastructure"
label variable SCMATEDU "Quality of school educational resources"
label variable SMRATIO "Maths Teacher-student ratio"
label variable STRATIO "Student-Teacher ratio"
label variable STUDCLIM "Student-Related Factors Affecting School Climate"
label variable TCHPARTI "Teacher participation/autonomy"
label variable TCMORALE "Teacher Morale"
label variable TCFOCST "Teacher focus"
label variable TCSHORT "Shortage of teaching  Staff"
label variable TEACCLIM "Teacher related factors affecting school climate"
label variable W_FSCHWT "GRADE NONRESPONSE ADJUSTED SCHOOL BASE WEIGHT"
label variable SENWGT_SCQ "Senate weight - sum of weight within the country is 1000"
label variable VER_SCQ "Date of the database creation"


* Including value labels 
label define SC01Q01F 1 "Public" 2 "Private" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC01Q01 SC01Q01F

label define SC03Q01F 1 "Village" 2 "Small Town" 3 "Town" 4 "City" 5 "Large City" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC03Q01 SC03Q01F

label define SC04Q01F 1 "Two or More" 2 "One Other" 3 "No Others" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC04Q01 SC04Q01F

label define SC13Q01F 1 "<10%" 2 "10-25%" 3 "26-50%" 4 "51-75%" 5 ">75%" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC13Q01 SC13Q01F

label define SC13Q02F 1 "<10%" 2 "10-25%" 3 "26-50%" 4 "51-75%" 5 ">75%" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC13Q02 SC13Q02F

label define SC13Q03F 1 "<10%" 2 "10-25%" 3 "26-50%" 4 "51-75%" 5 ">75%" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC13Q03 SC13Q03F

label define SC14Q01F 1 "Not at all" 2 "Very little" 3 "To some extent" 4 "A lot" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC14Q01 SC14Q01F

label define SC14Q02F 1 "Not at all" 2 "Very little" 3 "To some extent" 4 "A lot" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC14Q02 SC14Q02F

label define SC14Q03F 1 "Not at all" 2 "Very little" 3 "To some extent" 4 "A lot" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC14Q03 SC14Q03F

label define SC14Q04F 1 "Not at all" 2 "Very little" 3 "To some extent" 4 "A lot" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC14Q04 SC14Q04F

label define SC14Q05F 1 "Not at all" 2 "Very little" 3 "To some extent" 4 "A lot" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC14Q05 SC14Q05F

label define SC14Q06F 1 "Not at all" 2 "Very little" 3 "To some extent" 4 "A lot" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC14Q06 SC14Q06F

label define SC14Q07F 1 "Not at all" 2 "Very little" 3 "To some extent" 4 "A lot" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC14Q07 SC14Q07F

label define SC14Q08F 1 "Not at all" 2 "Very little" 3 "To some extent" 4 "A lot" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC14Q08 SC14Q08F

label define SC14Q09F 1 "Not at all" 2 "Very little" 3 "To some extent" 4 "A lot" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC14Q09 SC14Q09F

label define SC14Q10F 1 "Not at all" 2 "Very little" 3 "To some extent" 4 "A lot" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC14Q10 SC14Q10F

label define SC14Q11F 1 "Not at all" 2 "Very little" 3 "To some extent" 4 "A lot" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC14Q11 SC14Q11F

label define SC14Q12F 1 "Not at all" 2 "Very little" 3 "To some extent" 4 "A lot" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC14Q12 SC14Q12F

label define SC14Q13F 1 "Not at all" 2 "Very little" 3 "To some extent" 4 "A lot" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC14Q13 SC14Q13F

label define SC15Q01F 1 "For all classes" 2 "For some classes" 3 "Not for any classes" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC15Q01 SC15Q01F

label define SC15Q02F 1 "For all classes" 2 "For some classes" 3 "Not for any classes" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC15Q02 SC15Q02F

label define SC15Q03F 1 "For all classes" 2 "For some classes" 3 "Not for any classes" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC15Q03 SC15Q03F

label define SC15Q04F 1 "For all classes" 2 "For some classes" 3 "Not for any classes" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC15Q04 SC15Q04F

label define SC16Q01F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC16Q01 SC16Q01F

label define SC16Q02F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC16Q02 SC16Q02F

label define SC16Q03F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC16Q03 SC16Q03F

label define SC16Q04F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC16Q04 SC16Q04F

label define SC16Q05F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC16Q05 SC16Q05F

label define SC16Q06F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC16Q06 SC16Q06F

label define SC16Q07F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC16Q07 SC16Q07F

label define SC16Q08F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC16Q08 SC16Q08F

label define SC16Q09F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC16Q09 SC16Q09F

label define SC16Q10F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC16Q10 SC16Q10F

label define SC16Q11F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC16Q11 SC16Q11F

label define SC18Q01F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC18Q01 SC18Q01F

label define SC18Q02F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC18Q02 SC18Q02F

label define SC18Q03F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC18Q03 SC18Q03F

label define SC18Q04F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC18Q04 SC18Q04F

label define SC18Q05F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC18Q05 SC18Q05F

label define SC18Q06F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC18Q06 SC18Q06F

label define SC18Q07F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC18Q07 SC18Q07F

label define SC18Q08F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC18Q08 SC18Q08F

label define SC19Q01F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC19Q01 SC19Q01F

label define SC19Q02F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC19Q02 SC19Q02F

label define SC20Q01F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC20Q01 SC20Q01F

label define SC21Q05F 1 "Enrichment only" 2 "Remedial only" 3 "Both enrichment and remedial" 4 "Without differentiation" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC21Q05 SC21Q05F

label define SC22Q01F 1 "Not at all" 2 "Very little" 3 "To some extent" 4 "A lot" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC22Q01 SC22Q01F

label define SC22Q02F 1 "Not at all" 2 "Very little" 3 "To some extent" 4 "A lot" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC22Q02 SC22Q02F

label define SC22Q03F 1 "Not at all" 2 "Very little" 3 "To some extent" 4 "A lot" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC22Q03 SC22Q03F

label define SC22Q04F 1 "Not at all" 2 "Very little" 3 "To some extent" 4 "A lot" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC22Q04 SC22Q04F

label define SC22Q05F 1 "Not at all" 2 "Very little" 3 "To some extent" 4 "A lot" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC22Q05 SC22Q05F

label define SC22Q06F 1 "Not at all" 2 "Very little" 3 "To some extent" 4 "A lot" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC22Q06 SC22Q06F

label define SC22Q07F 1 "Not at all" 2 "Very little" 3 "To some extent" 4 "A lot" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC22Q07 SC22Q07F

label define SC22Q08F 1 "Not at all" 2 "Very little" 3 "To some extent" 4 "A lot" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC22Q08 SC22Q08F

label define SC22Q09F 1 "Not at all" 2 "Very little" 3 "To some extent" 4 "A lot" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC22Q09 SC22Q09F

label define SC22Q10F 1 "Not at all" 2 "Very little" 3 "To some extent" 4 "A lot" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC22Q10 SC22Q10F

label define SC22Q11F 1 "Not at all" 2 "Very little" 3 "To some extent" 4 "A lot" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC22Q11 SC22Q11F

label define SC22Q12F 1 "Not at all" 2 "Very little" 3 "To some extent" 4 "A lot" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC22Q12 SC22Q12F

label define SC22Q13F 1 "Not at all" 2 "Very little" 3 "To some extent" 4 "A lot" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC22Q13 SC22Q13F

label define SC22Q14F 1 "Not at all" 2 "Very little" 3 "To some extent" 4 "A lot" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC22Q14 SC22Q14F

label define SC22Q15F 1 "Not at all" 2 "Very little" 3 "To some extent" 4 "A lot" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC22Q15 SC22Q15F

label define SC22Q16F 1 "Not at all" 2 "Very little" 3 "To some extent" 4 "A lot" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC22Q16 SC22Q16F

label define SC22Q17F 1 "Not at all" 2 "Very little" 3 "To some extent" 4 "A lot" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC22Q17 SC22Q17F

label define SC22Q18F 1 "Not at all" 2 "Very little" 3 "To some extent" 4 "A lot" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC22Q18 SC22Q18F

label define SC22Q19F 1 "Not at all" 2 "Very little" 3 "To some extent" 4 "A lot" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC22Q19 SC22Q19F

label define SC24Q01F 1 "Many Parents" 2 "Minority of Parents" 3 "Largely absent" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC24Q01 SC24Q01F

label define SC26Q01F 1 "Strongly agree" 2 "Agree" 3 "Disagree" 4 "Strongly disagree" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC26Q01 SC26Q01F

label define SC26Q02F 1 "Strongly agree" 2 "Agree" 3 "Disagree" 4 "Strongly disagree" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC26Q02 SC26Q02F

label define SC26Q03F 1 "Strongly agree" 2 "Agree" 3 "Disagree" 4 "Strongly disagree" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC26Q03 SC26Q03F

label define SC26Q04F 1 "Strongly agree" 2 "Agree" 3 "Disagree" 4 "Strongly disagree" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC26Q04 SC26Q04F

label define SC27Q01F 1 "Strongly agree" 2 "Agree" 3 "Disagree" 4 "Strongly disagree" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC27Q01 SC27Q01F

label define SC27Q02F 1 "Strongly agree" 2 "Agree" 3 "Disagree" 4 "Strongly disagree" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC27Q02 SC27Q02F

label define SC28Q01F 1 "Strongly agree" 2 "Agree" 3 "Disagree" 4 "Strongly disagree" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC28Q01 SC28Q01F

label define SC28Q02F 1 "Strongly agree" 2 "Agree" 3 "Disagree" 4 "Strongly disagree" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC28Q02 SC28Q02F

label define SC29Q01F 1 "Strongly agree" 2 "Agree" 3 "Disagree" 4 "Strongly disagree" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC29Q01 SC29Q01F

label define SC29Q02F 1 "Strongly agree" 2 "Agree" 3 "Disagree" 4 "Strongly disagree" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC29Q02 SC29Q02F

label define SC30Q01F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC30Q01 SC30Q01F

label define SC30Q02F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC30Q02 SC30Q02F

label define SC30Q03F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC30Q03 SC30Q03F

label define SC30Q04F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC30Q04 SC30Q04F

label define SC31Q01F 1 "No change" 2 "A small change" 3 "A moderate change" 4 "A large change" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC31Q01 SC31Q01F

label define SC31Q02F 1 "No change" 2 "A small change" 3 "A moderate change" 4 "A large change" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC31Q02 SC31Q02F

label define SC31Q03F 1 "No change" 2 "A small change" 3 "A moderate change" 4 "A large change" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC31Q03 SC31Q03F

label define SC31Q04F 1 "No change" 2 "A small change" 3 "A moderate change" 4 "A large change" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC31Q04 SC31Q04F

label define SC31Q05F 1 "No change" 2 "A small change" 3 "A moderate change" 4 "A large change" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC31Q05 SC31Q05F

label define SC31Q06F 1 "No change" 2 "A small change" 3 "A moderate change" 4 "A large change" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC31Q06 SC31Q06F

label define SC31Q07F 1 "No change" 2 "A small change" 3 "A moderate change" 4 "A large change" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC31Q07 SC31Q07F

label define SC32Q01F 1 "Never" 2 "Sometimes" 3 "Always" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC32Q01 SC32Q01F

label define SC32Q03F 1 "Never" 2 "Sometimes" 3 "Always" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC32Q03 SC32Q03F

label define SC32Q04F 1 "Never" 2 "Sometimes" 3 "Always" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC32Q04 SC32Q04F

label define SC32Q05F 1 "Never" 2 "Sometimes" 3 "Always" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC32Q05 SC32Q05F

label define SC32Q06F 1 "Never" 2 "Sometimes" 3 "Always" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC32Q06 SC32Q06F

label define SC32Q07F 1 "Never" 2 "Sometimes" 3 "Always" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC32Q07 SC32Q07F

label define SC32Q08F 1 "Never" 2 "Sometimes" 3 "Always" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC32Q08 SC32Q08F

label define SC33Q01AF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q01A SC33Q01AF

label define SC33Q01BF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q01B SC33Q01BF

label define SC33Q01CF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q01C SC33Q01CF

label define SC33Q01DF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q01D SC33Q01DF

label define SC33Q01EF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q01E SC33Q01EF

label define SC33Q02AF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q02A SC33Q02AF

label define SC33Q02BF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q02B SC33Q02BF

label define SC33Q02CF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q02C SC33Q02CF

label define SC33Q02DF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q02D SC33Q02DF

label define SC33Q02EF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q02E SC33Q02EF

label define SC33Q03AF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q03A SC33Q03AF

label define SC33Q03BF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q03B SC33Q03BF

label define SC33Q03CF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q03C SC33Q03CF

label define SC33Q03DF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q03D SC33Q03DF

label define SC33Q03EF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q03E SC33Q03EF

label define SC33Q04AF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q04A SC33Q04AF

label define SC33Q04BF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q04B SC33Q04BF

label define SC33Q04CF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q04C SC33Q04CF

label define SC33Q04DF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q04D SC33Q04DF

label define SC33Q04EF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q04E SC33Q04EF

label define SC33Q05AF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q05A SC33Q05AF

label define SC33Q05BF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q05B SC33Q05BF

label define SC33Q05CF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q05C SC33Q05CF

label define SC33Q05DF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q05D SC33Q05DF

label define SC33Q05EF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q05E SC33Q05EF

label define SC33Q06AF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q06A SC33Q06AF

label define SC33Q06BF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q06B SC33Q06BF

label define SC33Q06CF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q06C SC33Q06CF

label define SC33Q06DF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q06D SC33Q06DF

label define SC33Q06EF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q06E SC33Q06EF

label define SC33Q07AF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q07A SC33Q07AF

label define SC33Q07BF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q07B SC33Q07BF

label define SC33Q07CF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q07C SC33Q07CF

label define SC33Q07DF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q07D SC33Q07DF

label define SC33Q07EF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q07E SC33Q07EF

label define SC33Q08AF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q08A SC33Q08AF

label define SC33Q08BF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q08B SC33Q08BF

label define SC33Q08CF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q08C SC33Q08CF

label define SC33Q08DF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q08D SC33Q08DF

label define SC33Q08EF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q08E SC33Q08EF

label define SC33Q09AF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q09A SC33Q09AF

label define SC33Q09BF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q09B SC33Q09BF

label define SC33Q09CF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q09C SC33Q09CF

label define SC33Q09DF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q09D SC33Q09DF

label define SC33Q09EF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q09E SC33Q09EF

label define SC33Q10AF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q10A SC33Q10AF

label define SC33Q10BF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q10B SC33Q10BF

label define SC33Q10CF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q10C SC33Q10CF

label define SC33Q10DF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q10D SC33Q10DF

label define SC33Q10EF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q10E SC33Q10EF

label define SC33Q11AF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q11A SC33Q11AF

label define SC33Q11BF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q11B SC33Q11BF

label define SC33Q11CF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q11C SC33Q11CF

label define SC33Q11DF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q11D SC33Q11DF

label define SC33Q11EF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q11E SC33Q11EF

label define SC33Q12AF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q12A SC33Q12AF

label define SC33Q12BF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q12B SC33Q12BF

label define SC33Q12CF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q12C SC33Q12CF

label define SC33Q12DF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q12D SC33Q12DF

label define SC33Q12EF 1 "Tick" 2 "No tick" 7 "N/A" 8 "Invalid" , replace
label values SC33Q12E SC33Q12EF

label define SC34Q01F 1 "Did not occur" 2 "1-2 times during the year" 3 "3-4 times during the year" 4 "Once a month" 5 "Once a week" 6 "More than once a week" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC34Q01 SC34Q01F

label define SC34Q02F 1 "Did not occur" 2 "1-2 times during the year" 3 "3-4 times during the year" 4 "Once a month" 5 "Once a week" 6 "More than once a week" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC34Q02 SC34Q02F

label define SC34Q03F 1 "Did not occur" 2 "1-2 times during the year" 3 "3-4 times during the year" 4 "Once a month" 5 "Once a week" 6 "More than once a week" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC34Q03 SC34Q03F

label define SC34Q04F 1 "Did not occur" 2 "1-2 times during the year" 3 "3-4 times during the year" 4 "Once a month" 5 "Once a week" 6 "More than once a week" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC34Q04 SC34Q04F

label define SC34Q05F 1 "Did not occur" 2 "1-2 times during the year" 3 "3-4 times during the year" 4 "Once a month" 5 "Once a week" 6 "More than once a week" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC34Q05 SC34Q05F

label define SC34Q06F 1 "Did not occur" 2 "1-2 times during the year" 3 "3-4 times during the year" 4 "Once a month" 5 "Once a week" 6 "More than once a week" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC34Q06 SC34Q06F

label define SC34Q07F 1 "Did not occur" 2 "1-2 times during the year" 3 "3-4 times during the year" 4 "Once a month" 5 "Once a week" 6 "More than once a week" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC34Q07 SC34Q07F

label define SC34Q08F 1 "Did not occur" 2 "1-2 times during the year" 3 "3-4 times during the year" 4 "Once a month" 5 "Once a week" 6 "More than once a week" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC34Q08 SC34Q08F

label define SC34Q09F 1 "Did not occur" 2 "1-2 times during the year" 3 "3-4 times during the year" 4 "Once a month" 5 "Once a week" 6 "More than once a week" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC34Q09 SC34Q09F

label define SC34Q10F 1 "Did not occur" 2 "1-2 times during the year" 3 "3-4 times during the year" 4 "Once a month" 5 "Once a week" 6 "More than once a week" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC34Q10 SC34Q10F

label define SC34Q11F 1 "Did not occur" 2 "1-2 times during the year" 3 "3-4 times during the year" 4 "Once a month" 5 "Once a week" 6 "More than once a week" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC34Q11 SC34Q11F

label define SC34Q12F 1 "Did not occur" 2 "1-2 times during the year" 3 "3-4 times during the year" 4 "Once a month" 5 "Once a week" 6 "More than once a week" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC34Q12 SC34Q12F

label define SC34Q13F 1 "Did not occur" 2 "1-2 times during the year" 3 "3-4 times during the year" 4 "Once a month" 5 "Once a week" 6 "More than once a week" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC34Q13 SC34Q13F

label define SC34Q14F 1 "Did not occur" 2 "1-2 times during the year" 3 "3-4 times during the year" 4 "Once a month" 5 "Once a week" 6 "More than once a week" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC34Q14 SC34Q14F

label define SC34Q15F 1 "Did not occur" 2 "1-2 times during the year" 3 "3-4 times during the year" 4 "Once a month" 5 "Once a week" 6 "More than once a week" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC34Q15 SC34Q15F

label define SC34Q16F 1 "Did not occur" 2 "1-2 times during the year" 3 "3-4 times during the year" 4 "Once a month" 5 "Once a week" 6 "More than once a week" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC34Q16 SC34Q16F

label define SC34Q17F 1 "Did not occur" 2 "1-2 times during the year" 3 "3-4 times during the year" 4 "Once a month" 5 "Once a week" 6 "More than once a week" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC34Q17 SC34Q17F

label define SC34Q18F 1 "Did not occur" 2 "1-2 times during the year" 3 "3-4 times during the year" 4 "Once a month" 5 "Once a week" 6 "More than once a week" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC34Q18 SC34Q18F

label define SC34Q19F 1 "Did not occur" 2 "1-2 times during the year" 3 "3-4 times during the year" 4 "Once a month" 5 "Once a week" 6 "More than once a week" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC34Q19 SC34Q19F

label define SC34Q20F 1 "Did not occur" 2 "1-2 times during the year" 3 "3-4 times during the year" 4 "Once a month" 5 "Once a week" 6 "More than once a week" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC34Q20 SC34Q20F

label define SC34Q22F 1 "Did not occur" 2 "1-2 times during the year" 3 "3-4 times during the year" 4 "Once a month" 5 "Once a week" 6 "More than once a week" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC34Q22 SC34Q22F

label define SC39Q01F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC39Q01 SC39Q01F

label define SC39Q02F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC39Q02 SC39Q02F

label define SC39Q03F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC39Q03 SC39Q03F

label define SC39Q05F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC39Q05 SC39Q05F

label define SC39Q06F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC39Q06 SC39Q06F

label define SC39Q07F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC39Q07 SC39Q07F

label define SC39Q08F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC39Q08 SC39Q08F

label define SC39Q09F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC39Q09 SC39Q09F

label define SC39Q10F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC39Q10 SC39Q10F

label define SC40Q01F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC40Q01 SC40Q01F

label define SC40Q02F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC40Q02 SC40Q02F

label define SC40Q03F 1 "Yes" 2 "No" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC40Q03 SC40Q03F

label define SC44Q01F 1 "Not likely" 2 "Likely" 3 "Very likely" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC44Q01 SC44Q01F

label define SC44Q02F 1 "Not likely" 2 "Likely" 3 "Very likely" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC44Q02 SC44Q02F

label define SC44Q03F 1 "Not likely" 2 "Likely" 3 "Very likely" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC44Q03 SC44Q03F

label define SC44Q04F 1 "Not likely" 2 "Likely" 3 "Very likely" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC44Q04 SC44Q04F

label define SC44Q05F 1 "Not likely" 2 "Likely" 3 "Very likely" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC44Q05 SC44Q05F

label define SC44Q06F 1 "Not likely" 2 "Likely" 3 "Very likely" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SC44Q06 SC44Q06F

label define ABGMATHF 1 "No ability grouping between any classes" 2 "One of these forms of ability grouping between classes for some classes" 3 "One of these forms of ability grouping for all classes" 8 "Invalid" 9 "Missing" , replace
label values ABGMATH ABGMATHF

label define LEADTCHF 9997 "N/A" 9998 "Invalid" 9999 "Missing" , replace
label values LEADTCH LEADTCHF

label define MATHEXCF 1 "Neither enrichment or remedial" 2 "Either enrichment and remedial" 3 "Both enrichment and remedial" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values MATHEXC MATHEXCF

label define SCHLTYPEF 1 "Private Independent" 2 "Private government-dependent" 3 "Public" 7 "N/A" 8 "Invalid" 9 "Missing" , replace
label values SCHLTYPE SCHLTYPEF

label define SCHSELF 1 "Two factors are never considered" 2 "At least one sometimes but neither always" 3 "At least one always considered" 9 "Missing" , replace
label values SCHSEL SCHSELF


* Converting variable names to lowercase
ds
foreach var of varlist _all {
    local lower_var = lower("`var'")
    if "`var'" != "`lower_var'" {
        rename `var' `lower_var'
    }
}

* Saving the data as a .dta file using the same name as the Excel file
save "cleaning/tempdata/school.dta", replace

