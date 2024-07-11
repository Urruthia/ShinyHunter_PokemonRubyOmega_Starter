#include<../ImageSearch2015/ImageSearch2015.au3>
Global $Inicial=0;
Global $Contador=0;
Global Const $x1=563
Global Const $y1=45
Global Const $x2=1350
Global Const $y2=990
Global Const $treex1=775
Global Const $treey1=210
Global Const $treex2=807
Global Const $treey2=338
Global Const $torx1=740
Global Const $tory1=300
Global Const $torx2=838
Global Const $tory2=390
Global Const $mudx1=720
Global Const $mudy1=318
Global Const $mudx2=827
Global Const $mudy2=396
Global Const $menx1=697
Global Const $meny1=137
Global Const $menx2=804
Global Const $meny2=254
Global Const $desx1=1072
Global Const $desy1=642
Global Const $desx2=1282
Global Const $desy2=783
Global $returnx = 0
Global $returny= 0
Global Const $pictureLeaf = "1.png"
Global Const $pictureMenu = "12.png"
Global Const $pictureOpcion = "3.png"
Global Const $pictureElige = "4.png"
Global Const $pictureDesicion = "5.png"
Global Const $pictureTreecko = "treecko.png"
Global Const $pictureTorchic = "torchic.png"
Global Const $pictureMudkip= "mudkip.png"
Global $menu = True
Global $exterior = True
Global $mochila = True
Global $desicion = True
Global $comprobando = True
Global $hunting = True

Func desitionAndComprobation($pokePicture, $pokx1,$poky1,$pokx2,$poky2)
	While $desicion
				$result5 = _ImageSearchArea($pictureDesicion,1,$desx1,$desy1,$desx2,$desy2,$returnx,$returny,0,0)

								if $result5=1 Then
									Sleep(100)
									While $result5=1
										send("{a}")
										$result5 = _ImageSearchArea($pictureDesicion,1,$desx1,$desy1,$desx2,$desy2,$returnx,$returny,0,0)
									WEnd
									$desicion = False
									EndIf

							WEnd
							While $comprobando
								$Contador+=1
								$result6 = _ImageSearchArea($pokePicture,1,$pokx1,$poky1,$pokx2,$poky2,$returnx,$returny,0,0)
								If $result6=1 Then
									$comprobando= False
									send("{q down}")
									send("{w down}")
									send("{m down}")
									send("{NUMPADADD down}")
									Sleep(1000)
									send("{q up}")
									send("{w up}")
									send("{m up}")
									send("{NUMPADADD up}")
									$Contador=0
									send("{NUMPADADD }")
								ElseIf $Contador = 1250 Then
									$hunting = False
									$comprobando= False
									MsgBox($MB_OK,"Econtrado!!!!!","Se encontro un shiny")
								EndIf

							WEnd
EndFunc

While $hunting

$result = _ImageSearchArea($pictureLeaf,1,$x1,$y1,$x2,$y2,$returnx,$returny,100,0)
If $result=1 Then
	send("{a down}")
	Sleep(500)
	send("{a up}")
	Sleep(2500)
	send("{a down}")
	Sleep(500)
	send("{a up}")
	While $menu
			$result2 = _ImageSearchArea($pictureMenu,1,$menx1,$meny1,$menx2,$meny2,$returnx,$returny,0,0)
			If $result2=1 Then
				send("{a down}")
				Sleep(500)
				send("{a up}")

					While $exterior
					$result3 = _ImageSearchArea($pictureOpcion,1,$x1,$y1,$x2,$y2,$returnx,$returny,50,0)
					If $result3=1 Then

					Sleep(1000)
					send("{a down}")
					Sleep(500)
					send("{a up}")


				While $mochila
						$result4 = _ImageSearchArea($pictureElige,1,$x1,$y1,$x2,$y2,$returnx,$returny,0,0)
						If $result4=1 Then

						Select
							#Treecko
						Case $Inicial==0
						Sleep(1500)
						send("{a down}")
						Sleep(1500)
						send("{a up}")

						send("{LEFT down}")
						Sleep(1500)
						send("{LEFT up}")
						send("{a down}")

						Sleep(500)
						send("{a up }")
						Sleep(500)
						send("{a down}")
						Sleep(500)
						send("{a up }")
						Sleep(500)
						send("{a down}")
						Sleep(500)
						send("{a up }")

						desitionAndComprobation($pictureTreecko,$treex1,$treey1,$treex2,$treey2)

						$Inicial+=1
						#Torchic
						Case $Inicial==1
						Sleep(1500)
						send("{a down}")
						Sleep(1500)
						send("{a up}")
						Sleep(500)
						send("{a up }")
						Sleep(500)
						send("{a down}")
						Sleep(500)
						send("{a up }")
						desitionAndComprobation($pictureTorchic,$torx1,$tory1,$torx2,$tory2)
						$Inicial+=1
						#Mudkip
						Case $Inicial==2
						Sleep(1500)
						send("{a down}")
						Sleep(1500)
						send("{a up}")

						send("{RIGHT down}")
						Sleep(1500)
						send("{RIGHT up}")
						send("{a down}")

						Sleep(500)
						send("{a up }")
						Sleep(500)
						send("{a down}")
						Sleep(500)
						send("{a up }")
						Sleep(500)
						send("{a down}")
						Sleep(500)
						send("{a up }")

						desitionAndComprobation($pictureMudkip,$mudx1,$mudy1,$mudx2,$mudy2)
						$Inicial=0
						EndSelect
							$mochila=False;
						EndIf

						WEnd
					$exterior = False;
					EndIf

				WEnd
			$menu = False;
			EndIf

		WEnd


EndIf
If $hunting==True Then
	$menu = True
	$exterior = True
	$desicion = True
	$comprobando = True
	$mochila = True
EndIf

WEnd

