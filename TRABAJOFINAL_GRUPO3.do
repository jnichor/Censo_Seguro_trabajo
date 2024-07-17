
*////////////////////////
* TRABAJO FINAL
*////////////////////////



*----------------------------
* GRÁFICO DE PIE
*----------------------------

use "CPV2017_POB.dta", clear
**c5_p8_1 c5_p8_2 c5_p8_3 c5_p8_4 c5_p8_5 c5_p8_6
br c5_p8_1 c5_p8_2 c5_p8_3 c5_p8_4 c5_p8_5 c5_p8_6
*Nos quedamos con las variables de intéres
keep c5_p8_1 c5_p8_2 c5_p8_3 c5_p8_4 c5_p8_5 c5_p8_6 ccdd ccpp ccdi area encarea viv hog thogar c5_p1 c5_p2 c5_p4_1
*Creación de la población afiliada a algún tipo de seguro de salud
gen asegurado=1 if c5_p8_6==0
replace asegurado=0 if c5_p8_6==1
label define afiliacion 1 "Con algún seguro de salud" 0 "Sin seguro de salud"
label values asegurado afiliacion
*Grafico pie de las personas con algún seguro
graph pie, over(asegurado) pie(1, color("128 255 255")) pie(2, color("128 128 255")) plabel(_all percent, size(medium)) line(lcolor(none)) title(Población censada por condición de tenencia de seguro de salud: 2017, size(medium) color(black) fcolor(none) lcolor(none)) note(Fuente: INEI-Censo Nacional de Población y Vivienda 2017, size(small)) legend(region(fcolor(none) lcolor(none))) plegend(nobox fcolor() region(fcolor(none)))
graph export "pie-algúntipodeseguro.png", as(png) replace

*Gráfico pie de personas con algún seguro por área 
graph pie, over(asegurado) pie(1, color("128 255 255")) pie(2, color("128 128 255")) plabel(_all percent, size(medium)) by(, title(Población censada por condición de tenencia de seguro de salud según área: 2017, size(medsmall) color(black)) note(Fuente: INEI-Censo Nacional de Población y Vivienda 2017, size(small))) legend(region(fcolor(none) lcolor(none))) by(, graphregion(fcolor(none)) plotregion(fcolor(none))) by(area) subtitle(, color(black) fcolor(none) lcolor(none))
graph export "pie-algúntipodeseguroxarea.png", as(png) replace


*Gráfico de pie de población censada con SIS
  graph pie, over(c5_p8_1) pie(1, color("128 255 255")) pie(2, color("128 128 255")) plabel(_all percent, size(medium)) line(lcolor(none)) title(Población censada afiliada únicamente al SIS: 2017, size(medium) color(black) fcolor(none) lcolor(none)) note(Fuente: INEI-Censo Nacional de Población y Vivienda 2017, size(small)) legend(region(fcolor(none) lcolor(none))) plegend(nobox fcolor() region(fcolor(none)))
 graph export "pie-sis.png", as(png) replace
  
 **Gráfico de población con sis por área
graph pie, over(c5_p8_1) pie(1, color("128 255 255")) pie(2, color("128 128 255")) plabel(_all percent, size(medium)) by(, title(Población censada afiliada únicamente al SIS según área: 2017, size(medsmall) color(black)) note(Fuente: INEI-Censo Nacional de Población y Vivienda 2017, size(small))) legend(region(fcolor(none) lcolor(none))) by(, graphregion(fcolor(none)) plotregion(fcolor(none))) by(area) subtitle(, color(black) fcolor(none) lcolor(none))
graph export "pie-sisxarea.png", as(png) replace

*Grafico pie EsSAlud
graph pie, over(c5_p8_2) pie(1, color("128 255 255")) pie(2, color("128 128 255")) plabel(_all percent, size(medium)) line(lcolor(none)) title(Población censada afiliada únicamente a EsSalud: 2017, size(medium) color(black) fcolor(none) lcolor(none)) note(Fuente: INEI-Censo Nacional de Población y Vivienda 2017, size(small)) legend(region(fcolor(none) lcolor(none))) plegend(nobox fcolor() region(fcolor(none)))
graph export "pie-essalud.png", as(png) replace


*Grafico personas con EsSAlud por área 
graph pie, over(c5_p8_2) pie(1, color("128 255 255")) pie(2, color("128 128 255")) plabel(_all percent, size(medium)) by(, title(Población censada afiliada únicamente a EsSalud según área: 2017, size(medsmall) color(black)) note(Fuente: INEI-Censo Nacional de Población y Vivienda 2017, size(small))) legend(region(fcolor(none) lcolor(none))) by(, graphregion(fcolor(none)) plotregion(fcolor(none))) by(area) subtitle(, color(black) fcolor(none) lcolor(none))
graph export "pie-essaludxarea.png", as(png) replace
  
 **Generamos una variable categorica para hacer un grafico de pie por cada tipo de seguro
 gen seguro=1 if c5_p8_1==1
 replace seguro=2 if c5_p8_2==1
 replace seguro=3 if c5_p8_3==1
 replace seguro=4 if c5_p8_4==1
 replace seguro=5 if c5_p8_5==1
 replace seguro=0 if c5_p8_6==1
 label define seguro 1"SIS" 2 "EsSAlud" 3 "Seguro de fuerzas armadas o policiales" 4 "Seguro privado" 5 "Otro seguro" 0 "Sin seguro"
 label values seguro seguro 
*Grafico pie tipo de seguro por area 
 graph pie, over(seguro) pie(_all, explode(small)) pie(1, color("128 255 255")) pie(2, color("128 128 255")) plabel(1 percent, size(vsmall)) plabel(2 percent, size(vsmall)) plabel(3 percent, size(vsmall)) plabel(4 percent, size(vsmall) orientation(vertical)) plabel(5 percent, size(vsmall) orientation(vertical)) plabel(6 percent, size(vsmall) orientation(vertical)) by(, title(Población rural y urbana por tipo de seguro: 2017, size(medsmall) color(black)) note(Fuente: INEI-Censo Nacional de Población y Vivienda 2017, size(small))) legend(region(fcolor(none) lcolor(none))) by(, graphregion(fcolor(none)) plotregion(fcolor(none))) by(area) subtitle(, color(black) fcolor(none) lcolor(none))
graph export "pie-tipodesaeguroxarea.png", as(png) replace
 
save CPV2017_POB_MOD.dta, replace







*----------------------------
* GRÁFICO DE BARRAS
*----------------------------

cd "C:\Users\User\OneDrive\Escritorio\Manejo de Base de datos\Ex. Final"

clear all
summarize mi_variable
centile mi_variable, percentiles(10 25 50 75 90)
tabulate mi_variable, summarize(mean median) centile(10 25 50 75 90)

*usamos la base de datos del Censo 2017 nivel poblacional 
use  "CPV2017_POB"

*nos quedamos con las variables que se utilizará
keep c5_p8_1 c5_p8_2 c5_p8_3 c5_p8_4 c5_p8_5 ubigeo factor_pond ccdd

*generamos la variable departamento
gen dpto=substr(ubigeo,1,2)
destring dpto, replace
label define lab_dpto 1 "Amazonas" 2 "Ancash" 3 "Apurímac" 4 "Arequipa" ///  
		5 "Ayacucho" 6 "Cajamarca" 7 "Callao" 8 "Cusco" 9 "Huancavelica" 10 "Huánuco" ///
		11 "Ica" 12 "Junín" 13 "La Libertad" 14 "Lambayeque" 15 "Lima" 	16 "Loreto" ///
		17 "Madre de Dios" 18 "Moquegua" 19 "Pasco" 20 "Piura" 21 "Puno" 22 "San Martín" ///
		23 "Tacna" 24 "Tumbes" 25 "Ucayali"
label values dpto lab_dpto

*generamos la variable seguro: 1= si la persona esta afiliada en al menos un seguro de salud y 0= caso contrario
gen seguro=1 if c5_p8_1==1 | c5_p8_1==1 | c5_p8_1==1 | c5_p8_1==1 | c5_p8_1==1 
replace seguro=0 if seguro==.

*guardamos la base de datos
save "garficodebarras.dta", replace

use "garficodebarras.dta", clear

*realizamos un gráfico de barras horizontal para medir el porcentaje de la población total afiliada a por lo menos un seguro de salud por departamento.
graph hbar (percent) seguro if seguro==1 [aw=factor_pond], ///
over(dpto, sort(seguro) descending label(labsize(small))) ///
title("Población censada afiliada a por lo menos un seguro de salud según departamento", size(small)) ///
subtitle("2017", size(small)) ///
note("Fuente: Elaboración propia", size(small)) ///
blabel(total, format(%12.1fc) size(vsmall)) 




graph save "Graficobarras.gph", replace
graph export "Graficobarras.png", as(png) replace








*----------------------------
* MAPA DEPARTAMENTAL
*----------------------------

// SIS //
clear all 
cd "C:\Users\User\OneDrive\Escritorio\Manejo de Base de datos\Ex. Final"

*usamos la base de datos del Censo 2017 nivel poblacional 
use  "CPV2017_POB", clear

*generamos la variable departamento
gen dpto=substr(ubigeo,1,2)
destring dpto, replace
label define lab_dpto 1 "AMAZONAS" 2 "ANCASH" 3 "APURÍMAC" 4 "AREQUIPA" ///  
		5 "AYACUCHO" 6 "CAJAMARCA" 7 "CALLAO" 8 "CUSCO" 9 "HUANCAVELICA" 10 "HUÁNUCO" ///
		11 "ICA" 12 "JUNÍN" 13 "LA LIBERTAD" 14 "LAMBAYEQUE" 15 "LIMA" 	16 "LORETO" ///
		17 "MADRE DE DIOS" 18 "MOQUEGUA" 19 "PASCO" 20 "PIURA" 21 "PUNO" 22 "SAN MARTÍN" ///
		23 "TACNA" 24 "TUMBES" 25 "UCAYALI"
label values dpto lab_dpto

keep c5_p8_1 c5_p8_2 c5_p8_4 dpto ccpp

save "CPV2017_POB_02", replace

*utilizamos el comando collapse para obtener el porcentaje de la población total que está afiliada al seguro de salud del SIS por cada departamento, lo ponemos en formato string y lo guardamos la base de datos.
egen total= total(c5_p8_1), by(dpto)
collapse total, by(dpto) 
decode dpto, gen(dpto1)
rename total sis
save "depa_sis2.dta", replace

*utilizo el formato shapefile para tener el mapa del Perú a nivel departamental
shp2dta using "DEPARTAMENTOS_inei_geogpsperu_suyopomalia.shp", database(perudpto) coordinates(corrdpto) genid(id) replace
*Usamos la base creada en el paso anterior
use perudpto, clear
*Renombramos a la variable DEPARTAMEN para poder hacer el merge
rename NOMBDEP dpto1

*se añaden tildes a algunos departamentos y procedemos a guardar la segunda base de datos
replace dpto1="APURÍMAC" if dpto1=="APURIMAC"
replace dpto1="HUÁNUCO" if dpto1=="HUANUCO"
replace dpto1="JUNÍN" if dpto1=="JUNIN"
replace dpto1="SAN MARTÍN" if dpto1=="SAN MARTIN"
save "perudpto1.dta", replace

*usamos el merge para unir a la primera y segunda base de datos 
merge 1:1 dpto1 using "depa_sis2.dta"
save "sisdpto.dta", replace 

*Representamos graficamente la distribución por departamento de la cantidad de afiliados al SIS
spmap sis using corrdpto.dta, id(id)  fcolor(Reds) clnumber(5) ///
title("Cobertura poblacional del SIS a nivel departamental", size(small)) ///
subtitle("2017", size(small)) ///
legend (pos (7) title ("Incidencia de acceso al SIS", size (*0.5))) ///
note ("Fuente: Elaboración propia")

graph export "SISdepartamental.png", as(png) replace



// ESSALUD //


*usamos la base de datos del Censo 2017 nivel poblacional modificada
use "CPV2017_POB_02", clear


*utilizamos el comando collapse para obtener el porcentaje de la población total que está afiliada al seguro de salud del SIS por cada departamento, lo ponemos en formato string y lo guardamos la base de datos.
egen total= total(c5_p8_2), by(dpto)
collapse total, by(dpto) 
decode dpto, gen(dpto1)
rename total EsSalud

save "depa_EsSalud.dta", replace


use "perudpto1.dta", clear
*usamos el merge para unir a la primera y segunda base de datos 
merge 1:1 dpto1 using "depa_EsSalud.dta"
save "EsSaluddpto.dta", replace 

*Representamos graficamente la distribución por departamento de la cantidad de afiliados al SIS
spmap EsSalud using corrdpto.dta, id(id)  fcolor(Reds) clnumber(5) ///
title("Cobertura poblacional de EsSalud a nivel departamental", size(small)) ///
subtitle("2017", size(small)) ///
legend (pos (7) title ("Incidencia de acceso a EsSalud", size (*0.5))) ///
note ("Fuente: Elaboración propia")

graph export "ESSALUDdepartamental.png", as(png) replace


// SEGURO PRIVADO //

*usamos la base de datos del Censo 2017 nivel poblacional modificada
use "CPV2017_POB_02", clear

*utilizamos el comando collapse para obtener el porcentaje de la población total que está afiliada a un seguro privado de salud por cada departamento, lo ponemos en formato string y lo guardamos la base de datos.

egen total= total(c5_p8_4), by(dpto)
collapse total, by(dpto)
decode dpto, gen(dpto1)
rename total priv

save "depa_priv.dta", replace

use "perudpto1.dta", clear
*usamos el merge para unir a la primera y segunda base de datos 
merge 1:1 dpto1 using "depa_priv.dta"
save "privdpto.dta", replace 

*Representamos graficamente la distribución por departamento del porcentaje de la población total afiliada a un seguro privado 
spmap priv using corrdpto.dta, id(id)  fcolor(Reds) clnumber(5) ///
title("Cobertura poblacional de seguro privado a nivel departamental", size(small)) ///
subtitle("2017", size(small)) ///
legend (pos (7) title ("Incidencia de acceso a un seguro privado", size (*0.5))) ///
note ("Fuente: Elaboración propia")

graph export "mapaseguropriv.png", as(png) replace



************************************************************************************************************************************************************************************



clear all
*----------------------------
* MAPA PROVINCIAL
*----------------------------


*------------
*Lima
*------------

// SIS //

*usamos la base de datos del Censo 2017 nivel poblacional modificada
use "CPV2017_POB_02", clear

*nos quedamos con el departamento Lima
keep if dpto==15
*pasamos la variable ccpp a formato numerico
destring ccpp, replace


*generamos la variable de provincia "prov". Cada categoria corresponde a una provincia de Lima, Guardamos la base de datos.
gen prov="LIMA" if ccpp==1
replace prov="BARRANCA" if ccpp==2
replace prov="CAJATAMBO" if ccpp==3
replace prov="CANTA" if ccpp==4
replace prov="CAÑETE" if ccpp==5
replace prov="HUARAL" if ccpp==6
replace prov="HUAROCHIRI" if ccpp==7
replace prov="HUAURA" if ccpp==8
replace prov="OYON" if ccpp==9
replace prov="YAUYOS" if ccpp==10

save "CPV2017_POB_03", replace

*generamos una variable "total" que indica el total de afiliados al SIS por cada provincia
egen total= total(c5_p8_1), by(prov)
*realizamos un collapse de esa variable para tener solo 13 observaciones que representan a cada provincia y su respectivo numero de afiliados al SIS. Procedemos tambien a guardar esa base de datos.
collapse total, by(prov) 
rename total sis1
save "provsis.dta",replace

*utilizo el formato shapefile para tener información sobre los departamentos y su respectivas provincias y lo guardamos en una segunda base de datos peruprov
shp2dta using "PROVINCIAS_inei_geogpsperu_suyopomalia.shp", database(peruprov) coordinates(corrprov) genid(id) replace

*abrimos la base de datos de provincias
use peruprov, clear
*nos quedamos unicamente con el departamento de Lima y le cambiamos de nombre a "prov" para que coincida con la variable de la primera base de datos. Finalmente realizamos el merge 1:1 para unir ambas base de datos
keep if NOMBDEP=="LIMA"
rename NOMBPROV prov
merge 1:1 prov using "provsis.dta"

*Representamos graficamente la distribución por provincia de la cantidad de afiliados al SIS en el departamento de Lima y guardamos los gráficos
spmap sis1 using corrprov, id(id)  fcolor(Reds) clnumber(5) ///
title("Cobertura poblacional del SIS a nivel provincial", size(small)) ///
subtitle("Lima 2017", size(small)) ///
legend (pos (7) title ("Incidencia de acceso al SIS", size (*0.5))) ///
note ("Fuente: Elaboración propia")
graph save "SISLIMA.gph", replace
graph export "SISLIMA.png", as(png) replace


save "LIMA_sis.dta", replace




// ESSALUD //

*usamos la base de datos del Censo 2017 nivel poblacional con información de Lima
use "CPV2017_POB_03", clear


*generamos una variable "total" que indica el total de afiliados al SIS por cada provincia
egen total= total(c5_p8_2), by(prov)
*realizamos un collapse de esa variable para tener solo 13 observaciones que representan a cada provincia y su respectivo numero de afiliados al SIS. Procedemos tambien a guardar esa base de datos.
collapse total, by(prov) 
rename total EsSalud
save "provEsSalud.dta",replace

*abrimos la base de datos de provincias
use peruprov, clear
*nos quedamos unicamente con el departamento de Lima y le cambiamos de nombre a "prov" para que coincida con la variable de la primera base de datos. Finalmente realizamos el merge 1:1 para unir ambas base de datos
keep if NOMBDEP=="LIMA"
rename NOMBPROV prov
merge 1:1 prov using "provEsSalud.dta"

*Representamos graficamente la distribución por provincia de la cantidad de afiliados al SIS en el departamento de Lima y guardamos los gráficos
spmap EsSalud using corrprov, id(id)  fcolor(Reds) clnumber(5) ///
title("Cobertura poblacional de EsSalud a nivel provincial", size(small)) ///
subtitle("Lima 2017", size(small)) ///
legend (pos (7) title ("Incidencia de acceso a EsSalud", size (*0.5))) ///
note ("Fuente: Elaboración propia")
graph save "EsSaludLIMA.gph", replace
graph export "EsSaludLIMA.png", as(png) replace


save "LIMA_EsSalud.dta", replace



// SEGURO PRIVADO //
*usamos la base de datos del Censo 2017 nivel poblacional con información de Lima
use "CPV2017_POB_03", clear

*generamos una variable "total" que indica el total de afiliados a un seguro privado de salud
egen total= total(c5_p8_4), by(prov)
*realizamos un collapse de esa variable para tener solo 13 observaciones que representan a cada provincia y su respectivo numero de afiliados al seguro privado de salud. Procedemos tambien a guardar esa base de datos.
collapse total, by(prov) 
rename total priv1
save "provpriv.dta",replace

*abrimos la base de datos de provincias
use peruprov, clear
*nos quedamos unicamente con el departamento de Lima y le cambiamos de nombre a "prov" para que coincida con la variable de la primera base de datos. Finalmente realizamos el merge 1:1 para unir ambas base de datos
keep if NOMBDEP=="LIMA"
rename NOMBPROV prov
merge 1:1 prov using "provpriv.dta"

*Representamos graficamente la distribución por provincia de la cantidad de afiliados al seguro priavdo de salud en el departamento de Lima y guardamos los gráficos
spmap priv1 using corrprov, id(id)  fcolor(Reds) clnumber(5) ///
title("Cobertura poblacional del seguro privado de salud a nivel provincial", size(small)) ///
subtitle("Lima 2017", size(small)) ///
legend (pos (7) title ("Incidencia de acceso al seguro privado de salud", size (*0.5))) ///
note ("Fuente: Elaboración propia")
graph save "PRIVLIMA.gph", replace
graph export "PRIVLIMA.png", as(png) replace


save "LIMA_priv.dta", replace


*------------
*MOQUEGUA
*------------


// SIS //


*usamos la base de datos del Censo 2017 modificada
use  "CPV2017_POB_02"

*nos quedamos con el departamento Moquegua
keep if dpto==18
*pasamos la variable ccpp a formato numerico
destring ccpp, replace

*generamos la variable de provincia "prov". Cada categoria corresponde a una provincia de Moquegua. Guardamos esa base de datos.
gen prov="MARISCAL NIETO" if ccpp==1
replace prov="GENERAL SANCHEZ CERRO" if ccpp==2
replace prov="ILO" if ccpp==3
save "CPV2017_POB_04", replace

*generamos una variable "total" que indica el total de afiliados al SIS por cada provincia
egen total= total(c5_p8_1), by(prov)
*realizamos un collapse de esa variable para tener solo 3 observaciones que representan a cada provincia y su respectivo numero de afiliados al SIS. Procedemos tambien a guardar esa base de datos.
collapse total, by(prov) 
rename total sis2
save "provsis2.dta",replace

use peruprov, clear
*nos quedamos unicamente con el departamento de Moquegua y le cambiamos de nombre a "prov" para que coincida con la variable de la primera base de datos. Finalmente realizamos el merge 1:1 para unir ambas base de datos
keep if NOMBDEP=="MOQUEGUA"
rename NOMBPROV prov
merge 1:1 prov using "provsis2.dta"

*Representamos graficamente la distribución por provincia de la cantidad de afiliados al SIS en el departamento de Moquegua y guardamos los gráficos.
spmap sis2 using corrprov, id(id)  fcolor(Reds) clnumber(3) ///
title("Cobertura poblacional del SIS a nivel provincial", size(small)) ///
subtitle("Moquegua 2017", size(small)) ///
legend (pos (5) title ("Incidencia de acceso al SIS", size (*0.5))) ///
note ("Fuente: Elaboración propia")
graph save "SISMOQUEGUA.gph", replace
graph export "SISMOQUEGUA.png", as(png) replace


save "MOQUEGUA_sis.dta", replace




// ESSALUD //


*usamos la base de datos del Censo 2017 nivel poblacional con información de Moquegua
use  "CPV2017_POB_04", clear

*generamos una variable "total" que indica el total de afiliados al SIS por cada provincia
egen total= total(c5_p8_2), by(prov)
*realizamos un collapse de esa variable para tener solo 3 observaciones que representan a cada provincia y su respectivo numero de afiliados al SIS. Procedemos tambien a guardar esa base de datos.
collapse total, by(prov) 
rename total EsSalud
save "provEsSalud2.dta",replace

use peruprov, clear
*nos quedamos unicamente con el departamento de Moquegua y le cambiamos de nombre a "prov" para que coincida con la variable de la primera base de datos. Finalmente realizamos el merge 1:1 para unir ambas base de datos
keep if NOMBDEP=="MOQUEGUA"
rename NOMBPROV prov
merge 1:1 prov using "provEsSalud2.dta"

*Representamos graficamente la distribución por provincia de la cantidad de afiliados al SIS en el departamento de Moquegua y guardamos los gráficos.
spmap EsSalud using corrprov, id(id)  fcolor(Reds) clnumber(3) ///
title("Cobertura poblacional del SIS a nivel provincial", size(small)) ///
subtitle("Moquegua 2017", size(small)) ///
legend (pos (5) title ("Incidencia de acceso al SIS", size (*0.5))) ///
note ("Fuente: Elaboración propia")
graph save "ESSALUDMOQUEGUA.gph", replace
graph export "ESSALUDMOQUEGUA.png", as(png) replace


save "MOQUEGUA_ESSALUD.dta", replace



// SEGURO PRIVADO //


*usamos la base de datos del Censo 2017 nivel poblacional con información de Moquegua
use  "CPV2017_POB_04", clear


*generamos una variable "total" que indica el total de afiliados a un seguro privado de salud por cada provincia
egen total= total(c5_p8_4), by(prov)
*realizamos un collapse de esa variable para tener solo 3 observaciones que representan a cada provincia y su respectivo numero de afiliados al seguro privado de salud. Procedemos tambien a guardar esa base de datos.
collapse total, by(prov) 
rename total priv2
save "provpriv2.dta",replace


use peruprov, clear
*nos quedamos unicamente con el departamento de Moquegua y le cambiamos de nombre a "prov" para que coincida con la variable de la primera base de datos. Finalmente realizamos el merge 1:1 para unir ambas base de datos
keep if NOMBDEP=="MOQUEGUA"
rename NOMBPROV prov
merge 1:1 prov using "provpriv2.dta"

*Representamos graficamente la distribución por provincia de la cantidad de afiliados a un seguro privado de salud en el departamento de Moquegua y guardamos los gráficos.
spmap priv2 using corrprov, id(id)  fcolor(Reds) clnumber(3) ///
title("Cobertura poblacional del seguro privado de salud a nivel provincial", size(small)) ///
subtitle("Moquegua 2017", size(small)) ///
legend (pos (5) title ("Incidencia de acceso al seguro privado", size (*0.5))) ///
note ("Fuente: Elaboración propia")
graph save "PRIVMOQUEGUA.gph", replace
graph export "PRIVMOQUEGUA.png", as(png) replace


save "MOQUEGUA_priv.dta", replace




*------------
*CAJAMARCA
*------------



// SIS //

clear all
*usamos la base de datos del Censo 2017 nivel poblacional modificada
use  "CPV2017_POB_02"

*nos quedamos con el departamento Cajamarca
keep if dpto==6
*pasamos la variable ccpp a formato numerico
destring ccpp, replace

*generamos la variable de provincia "prov". Cada categoria corresponde a una provincia de Cajamarca. Guardamos esa base de datos
gen prov="CAJAMARCA" if ccpp==1
replace prov="CAJABAMBA" if ccpp==2
replace prov="CELENDIN" if ccpp==3
replace prov="CHOTA" if ccpp==4
replace prov="CONTUMAZA" if ccpp==5
replace prov="CUTERVO" if ccpp==6
replace prov="HUALGAYOC" if ccpp==7
replace prov="JAEN" if ccpp==8
replace prov="SAN IGNACIO" if ccpp==9
replace prov="SAN MARCOS" if ccpp==10
replace prov="SAN MIGUEL" if ccpp==11
replace prov="SAN PABLO" if ccpp==12
replace prov="SANTA CRUZ" if ccpp==13

save "CPV2017_POB_05", replace

*generamos una variable "total" que indica el total de afiliados al SIS por cada provincia
egen total= total(c5_p8_1), by(prov)
*realizamos un collapse de esa variable para tener solo 13 observaciones que representan a cada provincia y su respectivo numero de afiliados al SIS. Procedemos tambien a guardar esa base de datos.
collapse total, by(prov) 
rename total sis3
save "provsis3.dta",replace

use peruprov, clear
*nos quedamos unicamente con el departamento de Cajamarca y le cambiamos de nombre a "prov" para que coincida con la variable de la primera base de datos. Finalmente realizamos el merge 1:1 para unir ambas base de datos
keep if NOMBDEP=="CAJAMARCA"
rename NOMBPROV prov
merge 1:1 prov using "provsis3.dta"


*Representamos graficamente la distribución por provincia de la cantidad de afiliados al SIS en el departamento de Cajamarca y guardamos los gráficos.
spmap sis3 using corrprov, id(id)  fcolor(Reds) clnumber(5) ///
title("Cobertura poblacional del SIS a nivel provincial", size(small)) ///
subtitle("Cajamarca 2017", size(small)) ///
legend (pos (2) title ("Incidencia de acceso al SIS", size (*0.5))) ///
note ("Fuente: Elaboración propia")
graph save "SISCAJAMARCA.gph", replace
graph export "SISCAJAMARCA.png", as(png) replace

save "CAJAMARCA_sis.dta", replace



// ESSALUD //


*usamos la base de datos del Censo 2017 con información de Cajamarca
use  "CPV2017_POB_05", clear

*generamos una variable "total" que indica el total de afiliados al SIS por cada provincia
egen total= total(c5_p8_2), by(prov)
*realizamos un collapse de esa variable para tener solo 13 observaciones que representan a cada provincia y su respectivo numero de afiliados al SIS. Procedemos tambien a guardar esa base de datos.
collapse total, by(prov) 
rename total EsSalud
save "provEsSalud3.dta",replace

use "provEsSalud3.dta"


use peruprov, clear
*nos quedamos unicamente con el departamento de Cajamarca y le cambiamos de nombre a "prov" para que coincida con la variable de la primera base de datos. Finalmente realizamos el merge 1:1 para unir ambas base de datos
keep if NOMBDEP=="CAJAMARCA"
rename NOMBPROV prov
merge 1:1 prov using "provEsSalud3.dta"


*Representamos graficamente la distribución por provincia de la cantidad de afiliados al SIS en el departamento de Cajamarca y guardamos los gráficos.
spmap EsSalud using corrprov, id(id)  fcolor(Reds) clnumber(5) ///
title("Cobertura poblacional de EsSalud a nivel provincial", size(small)) ///
subtitle("Cajamarca 2017", size(small)) ///
legend (pos (2) title ("Incidencia de acceso a EsSalud", size (*0.5))) ///
note ("Fuente: Elaboración propia")
graph save "EsSaludCAJAMARCA.gph", replace
graph export "EsSaludCAJAMARCA.png", as(png) replace

save "CAJAMARCA_EsSalud.dta", replace



// SEGURO PRIVADO //

clear all
*usamos la base de datos del Censo 2017 con información de Cajamarca
use  "CPV2017_POB_05", clear

*generamos una variable "total" que indica el total de afiliados al seguro privado de salud por cada provincia
egen total= total(c5_p8_4), by(prov)
*realizamos un collapse de esa variable para tener solo 13 observaciones que representan a cada provincia y su respectivo numero de afiliados al seguro privado. Procedemos tambien a guardar esa base de datos.
collapse total, by(prov) 
rename total priv3
save "provpriv3.dta",replace


use peruprov, clear
*nos quedamos unicamente con el departamento de Cajamarca y le cambiamos de nombre a "prov" para que coincida con la variable de la primera base de datos. Finalmente realizamos el merge 1:1 para unir ambas base de datos
keep if NOMBDEP=="CAJAMARCA"
rename NOMBPROV prov
merge 1:1 prov using "provpriv3.dta"


*Representamos graficamente la distribución por provincia de la cantidad de afiliados al seguro privado en el departamento de Cajamarca y guardamos los gráficos.
spmap priv3 using corrprov, id(id)  fcolor(Reds) clnumber(5) ///
title("Cobertura poblacional del seguro privado de salud a nivel provincial", size(small)) ///
subtitle("Cajamarca 2017", size(small)) ///
legend (pos (2) title ("Incidencia de acceso al seguro privado", size (*0.5))) ///
note ("Fuente: Elaboración propia")
graph save "PRIVCAJAMARCA.gph", replace
graph export "PRIVCAJAMARCA.png", as(png) replace

save "CAJAMARCA_priv.dta", replace





*----------------------------
* MAPAS DISTRITALES
*----------------------------


 use  CPV2017_POB_MOD.dta, clear
 *Colapsamos para obtener el porcentjae de estas variables a nivel de distrito 
 collapse c5_p8_1 c5_p8_2 c5_p8_3 c5_p8_4 c5_p8_5 seguro asegurado, by(ccdd ccpp ccdi)
 *generamos el ubigeo para hacer el merge
 gen ubigeo = ccdd + ccpp + ccdi
 save CPV2017_POB_MOD3.dta, replace //guardamos la base de datos para hacer el merge
 **Jalamos el shape y creamos un dta con esa información que se llame perudist. Generamos las coordenadas (llamada coordist) y un id (de referencia a cada distrito)
shp2dta using "DISTRITOS_inei_geogpsperu_suyopomalia.shp", database(perudist) coordinates(coordist) genid(id) replace

*------------
*MAPA DISTRITAL LIMA
*------------

**SIS 
**Usamos la base creada en el paso anterior
use perudist, clear
**Renombramos a la variable UBIGEO para poder hacer el merge
rename UBIGEO ubigeo
merge 1:1 ubigeo using CPV2017_POB_MOD3
*Nos quedamos con la provincia Lima para hacer el gráfico de sus distritos
keep if NOMBPROV=="LIMA"
spmap c5_p8_1 using coordist.dta, id(id) fcolor(Reds) ///
title("Cobertura poblacional del SIS a nivel distrital", size(small)) ///
subtitle("Lima 2017", size(small)) ///
legend (pos (7) title ("Incidencia de acceso al SIS", size (*0.5))) ///
note ("Fuente: Elaboración propia")
graph export "SISdistritolima.png", as(png) replace

*Essalud
use perudist, clear 
rename UBIGEO ubigeo
merge 1:1 ubigeo using CPV2017_POB_MOD3
keep if NOMBPROV=="LIMA"
spmap c5_p8_2 using coordist.dta, id(id) fcolor(Reds) ///
title("Cobertura poblacional del Essalud a nivel distrital", size(small)) ///
subtitle("Lima 2017", size(small)) ///
legend (pos (7) title ("Incidencia de acceso al Essalud", size (*0.5))) ///
note ("Fuente: Elaboración propia")
graph export "essaluddistritolima.png", as(png) replace

*Seguro Privado
use perudist, clear 
rename UBIGEO ubigeo
merge 1:1 ubigeo using CPV2017_POB_MOD3
keep if NOMBPROV=="LIMA"
spmap c5_p8_4 using coordist.dta, id(id) fcolor(Reds) ///
title("Cobertura poblacional de seguro privados a nivel distrital", size(small)) ///
subtitle("Lima 2017", size(small)) ///
legend (pos (7) title ("Incidencia de acceso a seguros privados", size (*0.5))) ///
note ("Fuente: Elaboración propia")
graph export "seguroprivadodistritolima.png", as(png) replace

*MAPA DISTRITAL-SANCHEZ CERRO  
*SIS
use perudist, clear 
rename UBIGEO ubigeo
merge 1:1 ubigeo using CPV2017_POB_MOD3
keep if NOMBPROV=="GENERAL SANCHEZ CERRO"
spmap c5_p8_1 using coordist.dta, id(id) fcolor(Reds) ///
title("Cobertura poblacional del SIS a nivel distrital", size(small)) ///
subtitle("General Sanchez Cerro 2017", size(small)) ///
legend (pos (5) title ("Incidencia de acceso al SIS", size (*0.5))) ///
note ("Fuente: Elaboración propia")
graph export "sis-distritossanchezcerro.png", as(png) replace

*Essalud
use perudist, clear 
rename UBIGEO ubigeo
merge 1:1 ubigeo using CPV2017_POB_MOD3
keep if NOMBPROV=="GENERAL SANCHEZ CERRO"
spmap c5_p8_2 using coordist.dta, id(id) fcolor(Reds) ///
title("Cobertura poblacional de Essalud a nivel distrital", size(small)) ///
subtitle("General Sanchez Cerro 2017", size(small)) ///
legend (pos (5) title ("Incidencia de acceso al Essalud", size (*0.5))) ///
note ("Fuente: Elaboración propia")
graph export "essalud-distritossanchezcerro.png", as(png) replace

*Seguro privado
use perudist, clear 
rename UBIGEO ubigeo
merge 1:1 ubigeo using CPV2017_POB_MOD3
keep if NOMBPROV=="GENERAL SANCHEZ CERRO"
spmap c5_p8_4 using coordist.dta, id(id) fcolor(Reds) ///
title("Cobertura poblacional de seguros privados a nivel distrital", size(small)) ///
subtitle("General Sanchez Cerro 2017", size(small)) ///
legend (pos (5) title ("Incidencia de acceso a seguros privados", size (*0.5))) ///
note ("Fuente: Elaboración propia")
graph export "seguroprivado-distritossanchezcerro.png", as(png) replace


*------------
*MAPA DISTRITAL JAEN 
*------------
*SIS
use perudist, clear 
rename UBIGEO ubigeo
merge 1:1 ubigeo using CPV2017_POB_MOD3
keep if NOMBPROV=="JAEN"
spmap c5_p8_1 using coordist.dta, id(id) fcolor(Reds) ///
title("Cobertura poblacional del SIS a nivel distrital", size(small)) ///
subtitle("Jaen 2017", size(small)) ///
legend (pos (5) title ("Incidencia de acceso al SIS", size (*0.5))) ///
note ("Fuente: Elaboración propia")
graph export "sis-distritosjaen.png", as(png) replace
*Essalud 
use perudist, clear 
rename UBIGEO ubigeo
merge 1:1 ubigeo using CPV2017_POB_MOD3
keep if NOMBPROV=="JAEN"
spmap c5_p8_2 using coordist.dta, id(id) fcolor(Reds) ///
title("Cobertura poblacional de Essalud a nivel distrital", size(small)) ///
subtitle("Jaen 2017", size(small)) ///
legend (pos (5) title ("Incidencia de acceso a Essalud", size (*0.5))) ///
note ("Fuente: Elaboración propia")
graph export "essalud-distritosjaen.png", as(png) replace

*Seguro privado 
use perudist, clear 
rename UBIGEO ubigeo
merge 1:1 ubigeo using CPV2017_POB_MOD3
keep if NOMBPROV=="JAEN"
spmap c5_p8_4 using coordist.dta, id(id) fcolor(Reds) ///
title("Cobertura poblacional de seguros privados a nivel distrital", size(small)) ///
subtitle("Jaen 2017", size(small)) ///
legend (pos (5) title ("Incidencia de acceso a seguros privados", size (*0.38))) ///
note ("Fuente: Elaboración propia")
graph export "seguroprivado-distritosjaen.png", as(png) replace






*----------------------------
* ESTADISTICOS DESCRIPTIVOS
*----------------------------
clear all
use  "CPV2017_POB"

*Renombramos las variables por el nombre correspondiente a cada seguro de salud 
rename c5_p8_1 SIS
rename c5_p8_2 EsSalud
rename c5_p8_3 FFAA
rename c5_p8_4 privado
rename c5_p8_5 otro_seguro
rename c5_p8_6 sin_seguro

*aplicamos el summarize para ver los estadisticos descriptivos de las variables
sum  SIS EsSalud FFAA privado otro_seguro sin_seguro

*exportamos la tabla a un documento Word
asdoc sum  SIS EsSalud FFAA privado otro_seguro sin_seguro, save(estadistico_descriptivo.doc)

*aplicamos el codebook para tener información más precisa de cada variable 
codebook SIS EsSalud FFAA privado otro_seguro sin_seguro

