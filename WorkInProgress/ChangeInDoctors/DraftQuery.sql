select 
[Provider Business Mailing Address State Name]
,[Healthcare Provider Taxonomy Code_1]
,[TotalProviders] = count(*)
from [Main_DW].[dbo].[dwcFactNPI]
where [Healthcare Provider Taxonomy Code_1] in
  (
  --Source: https://npidb.org/taxonomy/?parent=207V00000X
  '207V00000X' --Obstetrics & Gynecology
  ,'207VB0002X' --Bariatric Medicine
  ,'207VC0300X' --Complex Family Planning
  ,'207VC0200X' --Critical Care Medicine
  ,'207VF0040X' --Female Pelvic Medicine and Reconstructive Surgery
  ,'207VX0201X' --Gynecologic Oncology
  ,'207VG0400X' --Gynecology
  ,'207VH0002X' --Hospice and Palliative Medicine
  ,'207VM0101X' --Maternal & Fetal Medicine
  ,'207VX0000X' --Obstetrics
  ,'207VE0102X' --Reproductive Endocrinology
  )
group by 
[Provider Business Mailing Address State Name]
,[Healthcare Provider Taxonomy Code_1]
order by 3 desc

-------------------------------

select 
[Provider Business Mailing Address State Name]
,[Healthcare Provider Taxonomy Code_1]
,[TotalProviders] = count(*)
from [Main_DW].[dbo].[dwcFactNPI]
where [Healthcare Provider Taxonomy Code_1] in
  (
  --Source: https://npidb.org/taxonomy/?parent=207V00000X
  '207V00000X' --Obstetrics & Gynecology
  ,'207VB0002X' --Bariatric Medicine
  ,'207VC0300X' --Complex Family Planning
  ,'207VC0200X' --Critical Care Medicine
  ,'207VF0040X' --Female Pelvic Medicine and Reconstructive Surgery
  ,'207VX0201X' --Gynecologic Oncology
  ,'207VG0400X' --Gynecology
  ,'207VH0002X' --Hospice and Palliative Medicine
  ,'207VM0101X' --Maternal & Fetal Medicine
  ,'207VX0000X' --Obstetrics
  ,'207VE0102X' --Reproductive Endocrinology
  )
  and [Last Update Date] >= '6/24/2022'	--Date US Supreme Court overturned Roe v. Wade
group by 
[Provider Business Mailing Address State Name]
,[Healthcare Provider Taxonomy Code_1]
order by 3 desc

------------------------------------

select 
*
from [Main_DW].[dbo].[dwcFactNPI]
where [Healthcare Provider Taxonomy Code_1] in
  (
  --Source: https://npidb.org/taxonomy/?parent=207V00000X
  '207V00000X' --Obstetrics & Gynecology
  ,'207VB0002X' --Bariatric Medicine
  ,'207VC0300X' --Complex Family Planning
  ,'207VC0200X' --Critical Care Medicine
  ,'207VF0040X' --Female Pelvic Medicine and Reconstructive Surgery
  ,'207VX0201X' --Gynecologic Oncology
  ,'207VG0400X' --Gynecology
  ,'207VH0002X' --Hospice and Palliative Medicine
  ,'207VM0101X' --Maternal & Fetal Medicine
  ,'207VX0000X' --Obstetrics
  ,'207VE0102X' --Reproductive Endocrinology
  )
  and [Last Update Date] >= '6/24/2022'	--Date US Supreme Court overturned Roe v. Wade