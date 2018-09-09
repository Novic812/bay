#!/usr/bin/awk -f
BEGIN {
   FS = ","
   br["2018 09"] = 806
   br["2018 08"] = 945
   br["2018 07"] = 834
   br["2018 06"] = 520
   br["2018 05"] = 441
   br["2018 04"] = 407
   br["2018 03"] = 914
   br["2018 02"] = 1185
   br["2018 01"] = 740
   br["2017 12"] = 610
   br["2017 11"] = 436
   br["2017 10"] = 689
   # average 710.583
   # exclude company: ec["4CHANGE ENERGY"]
   # exclude plan: ro["Gexa Choice Conserve 5"]
}
NR == 1 {
   for (ta = 1; ta <= NF; ta++)
   {
      xr[$ta] = ta
   }
}
$xr["Rate Type"] == "Fixed" {
   for (ta in ec)
   {
      if ($xr["RepCompany"] == ta)
      {
         next
      }
   }
   for (ta in ro)
   {
      if ($xr["Plan Name"] == ta)
      {
         next
      }
   }
   tot = 0
   for (ta in br)
   {
      tot += $xr["Price/kWh " (br[ta] >= 1000 ? 1000 : 500)] * br[ta]
   }
   zu[NR, 1] = tot
   zu[NR, 2] = $xr["RepCompany"]
   zu[NR, 3] = $xr["Price/kWh 500"]
   zu[NR, 4] = $xr["Price/kWh 1000"]
}
END {
   for (ta = 2; ta <= NR; ta++)
   {
      printf "$%.0f - %s - 500 kWh %s - 1000 kWh %s\n",
      zu[ta, 1], zu[ta, 2], zu[ta, 3], zu[ta, 4]
   }
}
