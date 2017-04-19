local ver = "0.13"


if FileExist(COMMON_PATH.."MixLib.lua") then
 require('MixLib')
else
 PrintChat("MixLib not found. Please wait for download.")
 DownloadFileAsync("https://raw.githubusercontent.com/VTNEETS/NEET-Scripts/master/MixLib.lua", COMMON_PATH.."MixLib.lua", function() PrintChat("Downloaded MixLib. Please 2x F6!") return end)
end



require("DeftLib")
require("OpenPredict")
require("DamageLib")

function AutoUpdate(data)
    if tonumber(data) > tonumber(ver) then
        PrintChat('<font color = "#00FFFF">New version found! ' .. data)
        PrintChat('<font color = "#00FFFF">Downloading update, please wait...')
        DownloadFileAsync('https://raw.githubusercontent.com/allwillburn/Universal/master/Universal.lua', SCRIPT_PATH .. 'Universal.lua', function() PrintChat('<font color = "#00FFFF">Update Complete, please 2x F6!') return end)
    else
        PrintChat('<font color = "#00FFFF">No updates found!')
    end
end

GetWebResultAsync("https://raw.githubusercontent.com/allwillburn/Universal/master/Universal.version", AutoUpdate)


GetLevelPoints = function(unit) return GetLevel(unit) - (GetCastLevel(unit,0)+GetCastLevel(unit,1)+GetCastLevel(unit,2)+GetCastLevel(unit,3)) end
local SetDCP, SkinChanger = 0


local UniversalMenu = Menu("Universal", "Universal")

UniversalMenu:SubMenu("Combo", "Combo")

UniversalMenu.Combo:Boolean("Q1", "Use Q1 in combo", true)
UniversalMenu.Combo:Boolean("Q2", "Use Q2 in combo", false)
UniversalMenu.Combo:Boolean("Q3", "Use Q3 in combo", false)
UniversalMenu.Combo:Boolean("Q4", "Use Q4 in combo", false)
UniversalMenu.Combo:Boolean("", "")

UniversalMenu.Combo:Boolean("W1", "Use W1 in combo", true)
UniversalMenu.Combo:Boolean("W2", "Use W2 in combo", false)
UniversalMenu.Combo:Boolean("W3", "Use W3 in combo", false)
UniversalMenu.Combo:Boolean("W4", "Use W4 in combo", false)
UniversalMenu.Combo("", "")

UniversalMenu.Combo:Boolean("E1", "Use E1 in combo", true)
UniversalMenu.Combo:Boolean("E2", "Use E2 in combo", false)
UniversalMenu.Combo:Boolean("E3", "Use E3 in combo", false)
UniversalMenu.Combo:Boolean("E4", "Use E4 in combo", false)
UniversalMenu.Combo:Boolean("", "")

UniversalMenu.Combo:Boolean("R1", "Use R1 in combo", true)
UniversalMenu.Combo:Boolean("R2", "Use R2 in combo", false)
UniversalMenu.Combo:Boolean("R3", "Use R3 in combo", false)
UniversalMenu.Combo:Boolean("R4", "Use R4 in combo", false)
UniversalMenu.Combo:Boolean("", "", false)


UniversalMenu.Combo:Slider("RX", "X Enemies to Cast R",3,1,5,1)
UniversalMenu.Combo:Boolean("Cutlass", "Use Cutlass", true)
UniversalMenu.Combo:Boolean("Tiamat", "Use Tiamat", true)
UniversalMenu.Combo:Boolean("BOTRK", "Use BOTRK", true)
UniversalMenu.Combo:Boolean("RHydra", "Use RHydra", true)
UniversalMenu.Combo:Boolean("THydra", "Use THydra", true)
UniversalMenu.Combo:Boolean("YGB", "Use GhostBlade", true)
UniversalMenu.Combo:Boolean("Gunblade", "Use Gunblade", true)
UniversalMenu.Combo:Boolean("Randuins", "Use Randuins", true)


UniversalMenu:SubMenu("AutoMode", "AutoMode")
UniversalMenu.AutoMode:Boolean("Level", "Auto level spells", false)
UniversalMenu.AutoMode:Boolean("Ghost", "Auto Ghost", false)
UniversalMenu.AutoMode:Boolean("Q1", "Auto Q", false)
UniversalMenu.AutoMode:Boolean("Q2", "Auto Q", false)
UniversalMenu.AutoMode:Boolean("Q3", "Auto Q", false)
UniversalMenu.AutoMode:Boolean("Q4", "Auto Q", false)
UniversalMenu.AutoMode("", "" )
UniversalMenu.AutoMode:Boolean("W1", "Auto W", false)
UniversalMenu.AutoMode:Boolean("W2", "Auto W", false)
UniversalMenu.AutoMode:Boolean("W3", "Auto W", false)
UniversalMenu.AutoMode:Boolean("W4", "Auto W", false)
UniversalMenu.AutoMode("", "")
UniversalMenu.AutoMode:Boolean("E1", "Auto E1", false)
UniversalMenu.AutoMode:Boolean("E2", "Auto E2", false)
UniversalMenu.AutoMode:Boolean("E3", "Auto E3", false)
UniversalMenu.AutoMode:Boolean("E4", "Auto E4", false)
UniversalMenu.AutoMode("", "")
UniversalMenu.AutoMode:Boolean("R1", "Auto R1", false)
UniversalMenu.AutoMode:Boolean("R2", "Auto R2", false)
UniversalMenu.AutoMode:Boolean("R3", "Auto R3", false)
UniversalMenu.AutoMode:Boolean("R4", "Auto R4", false)

UniversalMenu:SubMenu("AutoFarm", "AutoFarm")
UniversalMenu.AutoFarm:Boolean("Q1", "AutoQ1", true)
UniversalMenu.AutoFarm:Boolean("Q2", "AutoQ2", true)
UniversalMenu.AutoFarm:Boolean("Q3", "AutoQ3", true)
UniversalMenu.AutoFarm:Boolean("Q4", "AutoQ4", true)
UniversalMenu.AutoFarm("", "")


UniversalMenu.AutoFarm:Boolean("W1", "AutoW1", true)
UniversalMenu.AutoFarm:Boolean("W2", "AutoW2", true)
UniversalMenu.AutoFarm:Boolean("W3", "AutoW3", true)
UniversalMenu.AutoFarm:Boolean("W4", "AutoW4", true)
UniversalMenu.AutoFarm:Boolean("", "")


UniversalMenu.AutoFarm:Boolean("E1", "AutoE1", true)
UniversalMenu.AutoFarm:Boolean("E2", "AutoE2", true)
UniversalMenu.AutoFarm:Boolean("E3", "AutoE3", true)
UniversalMenu.AutoFarm:Boolean("E4", "AutoE4", true)
UniversalMenu.AutoFarm("", "")


UniversalMenu:SubMenu("LaneClear", "LaneClear")
UniversalMenu.LaneClear:Boolean("Q1", "Use Q1", true)
UniversalMenu.LaneClear:Boolean("Q2", "Use Q2", true)
UniversalMenu.LaneClear:Boolean("Q3", "Use Q3", true)
UniversalMenu.LaneClear:Boolean("Q4", "Use Q4", true)
UniversalMenu.LaneClear("", "")

UniversalMenu.LaneClear:Boolean("W1", "Use W1", true)
UniversalMenu.LaneClear:Boolean("W2", "Use W2", true)
UniversalMenu.LaneClear:Boolean("W3", "Use W3", true)
UniversalMenu.LaneClear:Boolean("W4", "Use W4", true)
UniversalMenu.LaneClear("", "")

UniversalMenu.LaneClear:Boolean("E1", "Use E1", true)
UniversalMenu.LaneClear:Boolean("E2", "Use E2", true)
UniversalMenu.LaneClear:Boolean("E3", "Use E3", true)
UniversalMenu.LaneClear:Boolean("E4", "Use E4", true)
UniversalMenu.LaneClear:Boolean("RHydra", "Use RHydra", true)
UniversalMenu.LaneClear:Boolean("Tiamat", "Use Tiamat", true)

UniversalMenu:SubMenu("Harass", "Harass")
UniversalMenu.Harass:Boolean("Q", "Use Q", true)

UniversalMenu:SubMenu("KillSteal", "KillSteal")
UniversalMenu.KillSteal:Boolean("Q1", "KS w Q1", true)
UniversalMenu.KillSteal:Boolean("Q2", "KS w Q2", true)
UniversalMenu.KillSteal:Boolean("Q3", "KS w Q3", true)
UniversalMenu.KillSteal:Boolean("Q4", "KS w Q4", true)
UniversalMenu.KillSteal:Boolean("", "")

UniversalMenu.KillSteal:Boolean("W1", "KS w W1", true)
UniversalMenu.KillSteal:Boolean("W2", "KS w W2", true)
UniversalMenu.KillSteal:Boolean("W3", "KS w W3", true)
UniversalMenu.KillSteal:Boolean("W4", "KS w W4", true)
UniversalMenu.KillSteal:Boolean("", "")


UniversalMenu.KillSteal:Boolean("E1", "KS w E1", true)
UniversalMenu.KillSteal:Boolean("E2", "KS w E2", true)
UniversalMenu.KillSteal:Boolean("E3", "KS w E3", true)
UniversalMenu.KillSteal:Boolean("E4", "KS w E4", true)
UniversalMenu.KillSteal:Boolean("", "")

UniversalMenu.KillSteal:Boolean("R1", "KS w R1", true)
UniversalMenu.KillSteal:Boolean("R2", "KS w R2", true)
UniversalMenu.KillSteal:Boolean("R3", "KS w R3", true)
UniversalMenu.KillSteal:Boolean("R4", "KS w R4", true)

UniversalMenu:SubMenu("AutoIgnite", "AutoIgnite")
UniversalMenu.AutoIgnite:Boolean("Ignite", "Ignite if killable", true)

UniversalMenu:SubMenu("UserGuide", "UserGuide")
UniversalMenu.UserGuide("1", "set to 1 for skillshot")
UniversalMenu.UserGuide("2", "set to 2 for enemy targeted spell")
UniversalMenu.UserGuide("3", "set to 3 for self cast")
UniversalMenu.UserGuide("4", "set to 4 for ground targeted spell ")




UniversalMenu:SubMenu("SkinChanger", "SkinChanger")
UniversalMenu.SkinChanger:Boolean("Skin", "UseSkinChanger", true)
UniversalMenu.SkinChanger:Slider("SelectedSkin", "Select A Skin:", 1, 0, 4, 1, function(SetDCP) HeroSkinChanger(myHero, SetDCP)  end, true)

OnTick(function (myHero)
	local target = GetCurrentTarget()
        local YGB = GetItemSlot(myHero, 3142)
	local RHydra = GetItemSlot(myHero, 3074)
	local THydra = GetItemSlot(myHero, 3748)
	local Tiamat = GetItemSlot(myHero, 3077)
        local Gunblade = GetItemSlot(myHero, 3146)
        local BOTRK = GetItemSlot(myHero, 3153)
        local Cutlass = GetItemSlot(myHero, 3144)
        local Randuins = GetItemSlot(myHero, 3143) 
        local BonusAD = GetBonusDmg(myHero)
        local BaseAD = GetBaseDamage(myHero)
	local BonusAP = GetBonusDmg(myHero)
        local BaseAP = GetBaseDamage(myHero)
	
	--AUTO LEVEL UP
	if UniversalMenu.AutoMode.Level:Value() then

			spellorder = {_E, _W, _Q, _W, _W, _R, _W, _Q, _W, _Q, _R, _Q, _Q, _E, _E, _R, _E, _E}
			if GetLevelPoints(myHero) > 0 then
				LevelSpell(spellorder[GetLevel(myHero) + 1 - GetLevelPoints(myHero)])
			end
	end
        
        --Harass
          if Mix:Mode() == "Harass" then
            if UniversalMenu.Harass.Q:Value() and Ready(_Q) and ValidTarget(target, 475) then
				if target ~= nil then 
                                      CastSkillShot(_Q, target)
                                end
            end
     
          end

	--COMBO
	  if Mix:Mode() == "Combo" then
            if UniversalMenu.Combo.YGB:Value() and YGB > 0 and Ready(YGB) and ValidTarget(target, 700) then
			CastSpell(YGB)
            end

            if UniversalMenu.Combo.Randuins:Value() and Randuins > 0 and Ready(Randuins) and ValidTarget(target, 500) then
			CastSpell(Randuins)
            end

            if UniversalMenu.Combo.BOTRK:Value() and BOTRK > 0 and Ready(BOTRK) and ValidTarget(target, 550) then
			 CastTargetSpell(target, BOTRK)
            end

            if UniversalMenu.Combo.Cutlass:Value() and Cutlass > 0 and Ready(Cutlass) and ValidTarget(target, 700) then
			 CastTargetSpell(target, Cutlass)
            end
			
	    	 if UniversalMenu.Combo.Tiamat:Value() and Tiamat > 0 and Ready(Tiamat) and ValidTarget(target, 350) then
			CastSpell(Tiamat)
            end

            if UniversalMenu.Combo.Gunblade:Value() and Gunblade > 0 and Ready(Gunblade) and ValidTarget(target, 700) then
			CastTargetSpell(target, Gunblade)
            end

            if UniversalMenu.Combo.RHydra:Value() and RHydra > 0 and Ready(RHydra) and ValidTarget(target, 400) then
			CastSpell(RHydra)
            end
			
	    if UniversalMenu.Combo.THydra:Value() and THydra > 0 and Ready(THydra) and ValidTarget(target, 400) then
			CastSpell(THydra)
            end			



			
			
		
	    
            if UniversalMenu.Combo.E1:Value() and Ready(_E) and ValidTarget(target, GetCastRange(myHero,_E)) then
			CastSkillShot(_E, target)
	    end

            if UniversalMenu.Combo.E2:Value() and Ready(_E) and ValidTarget(target, GetCastRange(myHero,_E)) then
			CastTargetSpell(target,_E)
	    end			
	    
            if UniversalMenu.Combo.E3:Value() and Ready(_E) and ValidTarget(target, GetCastRange(myHero,_E)) then
			CastSpell(_E)
	    end			
	    
            	        			
	    if UniversalMenu.Combo.E4:Value() and Ready(_E) and ValidTarget(target, GetCastRange(myHero,_E)) then
			CastSkillShot(_E, target.pos)	
	    end			
	        
               


               
             
            

            

            if UniversalMenu.Combo.Q1:Value() and Ready(_Q) and ValidTarget(target, GetCastRange(myHero,_Q)) then
		     if target ~= nil then 
                         CastSkillShot(_Q, target)
                     end
	    end			
            
            if UniversalMenu.Combo.Q2:Value() and Ready(_Q) and ValidTarget(target, GetCastRange(myHero,_Q)) then 
                         CastTargetSpell(target, _Q)
	    end
			
            		
            
            if UniversalMenu.Combo.Q3:Value() and Ready(_Q) and ValidTarget(target, GetCastRange(myHero,_Q)) then 
                         CastSpell(_Q)   
	    end	
			
            if UniversalMenu.Combo.Q4:Value() and Ready(_Q) and ValidTarget(target, GetCastRange(myHero,_Q)) then
			CastSkillShot(_Q, target.pos)	
	    end			
		




		
				
               
            if UniversalMenu.Combo.W1:Value() and Ready(_W) and ValidTarget(target, GetCastRange(myHero,_W)) then
			CastSkillShot(_W, target)
	    end	
              
            if UniversalMenu.Combo.W2:Value() and Ready(_W) and ValidTarget(target, GetCastRange(myHero,_W)) then
			CastTargetSpell(target, _W)
	    end
			
	           				    
            if UniversalMenu.Combo.W3:Value() and Ready(_W) and ValidTarget(target, GetCastRange(myHero,_W)) then
			CastSpell(_W) 
	    end
			
	    if UniversalMenu.Combo.W4:Value() and Ready(_W) and ValidTarget(target, GetCastRange(myHero,_W)) then
			CastSkillShot(_W, target.pos)	
	    end			
	       
              
             


            
	    
	    	 
	    if UniversalMenu.Combo.R1:Value() and Ready(_R) and ValidTarget(target, GetCastRange(myHero,_R)) then
			CastSkillShot(_R, target)
	    end			
	    
            if UniversalMenu.Combo.R2:Value() and Ready(_R) and ValidTarget(target, GetCastRange(myHero,_R)) then
			CastTargetSpell(target, _R)
	    end			
	    
            			
	    
            if UniversalMenu.Combo.R3:Value() and Ready(_R) and ValidTarget(target, GetCastRange(myHero,_R)) then
			CastSpell(_R) 
	    end
			
	    if UniversalMenu.Combo.R4:Value() and Ready(_R) and ValidTarget(target, GetCastRange(myHero,_R)) then
			CastSkillShot(_R, target.pos)		
	       end
           end
			
              
             
            



         

         --AUTO IGNITE
	for _, enemy in pairs(GetEnemyHeroes()) do
		
		if GetCastName(myHero, SUMMONER_1) == 'SummonerDot' then
			 Ignite = SUMMONER_1
			if ValidTarget(enemy, 600) then
				if 20 * GetLevel(myHero) + 50 > GetCurrentHP(enemy) + GetHPRegen(enemy) * 3 then
					CastTargetSpell(enemy, Ignite)
				end
			end

		elseif GetCastName(myHero, SUMMONER_2) == 'SummonerDot' then
			 Ignite = SUMMONER_2
			if ValidTarget(enemy, 600) then
				if 20 * GetLevel(myHero) + 50 > GetCurrentHP(enemy) + GetHPRegen(enemy) * 3 then
					CastTargetSpell(enemy, Ignite)
				end
			end
		end

	end




        for _, enemy in pairs(GetEnemyHeroes()) do
                
                if IsReady(_Q) and ValidTarget(enemy, QRange) and UniversalMenu.KillSteal.Q1:Value() and GetHP(enemy) < getdmg("Q",enemy) then		         
                                      CastSkillShot(_Q, target)
		         
                end 
			
		if IsReady(_Q) and ValidTarget(enemy, QRange) and UniversalMenu.KillSteal.Q2:Value() and GetHP(enemy) < getdmg("Q",enemy) then		         
                                     CastTargetSpell(target, _Q)
		end 
			
		if IsReady(_Q) and ValidTarget(enemy, QRange) and UniversalMenu.KillSteal.Q3:Value() and GetHP(enemy) < getdmg("Q",enemy) then		         
                                      CastTargetSpell(target, _Q)
	        end 	
			
		if IsReady(_Q) and ValidTarget(enemy, QRange) and UniversalMenu.KillSteal.Q4:Value() and GetHP(enemy) < getdmg("Q",enemy) then		         
                                      CastSkillShot(_Q, target.pos)
	        end 
			
	
			
			
		
	        if IsReady(_W) and ValidTarget(enemy, WRange) and UniversalMenu.KillSteal.W1:Value() and GetHP(enemy) < getdmg("W",enemy) then		         
                                      CastSkillShot(_W, target)
		end 
			
                if IsReady(_W) and ValidTarget(enemy, WRange) and UniversalMenu.KillSteal.W2:Value() and GetHP(enemy) < getdmg("W",enemy) then		         
                                      CastTargetSpell(target, _W)
		end 
			
	        if IsReady(_W) and ValidTarget(enemy, WRange) and UniversalMenu.KillSteal.W3:Value() and GetHP(enemy) < getdmg("W",enemy) then		         
                                      CastSpell(_W)
		end 
			
			if IsReady(_W) and ValidTarget(enemy, WRange) and UniversalMenu.KillSteal.W4:Value() and GetHP(enemy) < getdmg("W",enemy) then		         
                                      CastSkillShot(_W, target.pos)
		end 
		
		
			

                if IsReady(_E) and ValidTarget(enemy, ERange) and UniversalMenu.KillSteal.E1:Value() and GetHP(enemy) < getdmg("E",enemy) then
		                    CastSkillShot(_E, target)
                end
			
		if IsReady(_E) and ValidTarget(enemy, ERange) and UniversalMenu.KillSteal.E2:Value() and GetHP(enemy) < getdmg("E",enemy) then
		                     CastTargetSpell(target,_E)
                end
			
		if IsReady(_E) and ValidTarget(enemy, ERange) and UniversalMenu.KillSteal.E3:Value() and GetHP(enemy) < getdmg("E",enemy) then
		                     CastSpell(_E)
                end
			
		if IsReady(_E) and ValidTarget(enemy, ERange) and UniversalMenu.KillSteal.E4:Value() and GetHP(enemy) < getdmg("E",enemy) then
		                      CastSkillShot(_E, target.pos)
                end
			
			
			
			
		if IsReady(_R) and ValidTarget(enemy, RRange) and UniversalMenu.KillSteal.R1:Value() and GetHP(enemy) < getdmg("R",enemy) then
		                      CastSkillShot(_R, target)
                end
			
		if IsReady(_R) and ValidTarget(enemy, RRange) and UniversalMenu.KillSteal.R2:Value() and GetHP(enemy) < getdmg("R",enemy) then
		                     CastTargetSpell(target, _R)  
                end
			
		if IsReady(_R) and ValidTarget(enemy, RRange) and UniversalMenu.KillSteal.R3:Value() and GetHP(enemy) < getdmg("R",enemy) then
		                     CastSpell(_R)
                end
			
		if IsReady(_R) and ValidTarget(enemy, RRange) and UniversalMenu.KillSteal.R4:Value() and GetHP(enemy) < getdmg("R",enemy) then
		                     CastSkillShot(_R, target.pos)
                end
      end




      if Mix:Mode() == "LaneClear" then
      	  for _,closeminion in pairs(minionManager.objects) do
	        if UniversalMenu.LaneClear.Q1:Value() and Ready(_Q) and ValidTarget(minion, GetCastRange(myHero,_Q)) then
	        	CastSkillShot(_Q, minion)
                end
				
	        if UniversalMenu.LaneClear.Q2:Value() and Ready(_Q) and ValidTarget(minion, GetCastRange(myHero,_Q)) then
	        	CastTargetSpell(minion, _Q)
                end
				
	        if UniversalMenu.LaneClear.Q3:Value() and Ready(_Q) and ValidTarget(minion, GetCastRange(myHero,_Q)) then
	        	CastSpell(_Q)
                end
				
		if UniversalMenu.LaneClear.Q4:Value() and Ready(_Q) and ValidTarget(minion, GetCastRange(myHero,_Q)) then
	        	CastSkillShot(_Q, target.pos)
                end	
				
				
				
			
		if UniversalMenu.LaneClear.W1:Value() and Ready(_W) and ValidTarget(minion, GetCastRange(myHero,_W)) then
	        	CastSkillShot(_W, minion)
	        end
				
		if UniversalMenu.LaneClear.W2:Value() and Ready(_W) and ValidTarget(minion, GetCastRange(myHero,_W)) then
	        	CastTargetSpell(minion, _W)
	        end	
				
		if UniversalMenu.LaneClear.W3:Value() and Ready(_W) and ValidTarget(minion, GetCastRange(myHero,_W)) then
	        	CastSpell(_W)
	        end
				
		if UniversalMenu.LaneClear.W4:Value() and Ready(_W) and ValidTarget(minion, GetCastRange(myHero,_W)) then
	        	CastSkillShot(_W, target.pos)
	        end		
				
		
				
		
				


                if UniversalMenu.LaneClear.E1:Value() and Ready(_E) and ValidTarget(minion, GetCastRange(myHero,_E)) then
	        	CastSkillShot(_E, minion)
	        end
				
		if UniversalMenu.LaneClear.E2:Value() and Ready(_E) and ValidTarget(minion, GetCastRange(myHero,_E)) then
	        	CastTargetSpell(minion, _E)
	        end
				
	        if UniversalMenu.LaneClear.E3:Value() and Ready(_E) and ValidTarget(minion, GetCastRange(myHero,_E)) then
	        	CastSpell(_E)
	        end
				
		if UniversalMenu.LaneClear.E4:Value() and Ready(_E) and ValidTarget(minion, GetCastRange(myHero,_E)) then
	        	CastSkillShot(_E, target.pos)
	        end	
	
	

                if UniversalMenu.LaneClear.Tiamat:Value() and ValidTarget(closeminion, 350) then
			CastSpell(Tiamat)
		end
	
		if UniversalMenu.LaneClear.RHydra:Value() and ValidTarget(closeminion, 400) then
                        CastTargetSpell(closeminion, RHydra)
      	        end
          end
      end



        --AutoMode
        if UniversalMenu.AutoMode.Q1:Value() then        
          if Ready(_Q) and ValidTarget(target, QRange) then
		      CastSkillShot(_Q, target)
          end
        end 
		
		if UniversalMenu.AutoMode.Q2:Value() then        
          if Ready(_Q) and ValidTarget(target, QRange) then
		      CastSkillShot(_Q, target)
          end
        end 
		
	if UniversalMenu.AutoMode.Q3:Value() then        
          if Ready(_Q) and ValidTarget(target, QRange) then
		      CastSpell(_Q)
          end
        end 
		
	if UniversalMenu.AutoMode.Q4:Value() then        
          if Ready(_Q) and ValidTarget(target, QRange) then
		     CastSkillShot(_Q, target.pos)
          end
        end 
		
		
		
		
        if UniversalMenu.AutoMode.W1:Value() then        
          if Ready(_W) and ValidTarget(target, WRange) then
	  	      CastSkillShot(_W, target)
          end
        end
		
	if UniversalMenu.AutoMode.W2:Value() then        
          if Ready(_W) and ValidTarget(target, WRange) then
	  	      CastSkillShot(_W, target)
          end
        end
		
	if UniversalMenu.AutoMode.W3:Value() then        
          if Ready(_W) and ValidTarget(target, WRange) then
	  	      CastSpell(_W)
          end
        end
		
	if UniversalMenu.AutoMode.W4:Value() then        
          if Ready(_W) and ValidTarget(target, WRange) then
	  	     CastSkillShot(_W, target.pos)
          end
        end
		
		
		
		
		
		
        if UniversalMenu.AutoMode.E1:Value() then        
	  if Ready(_E) and ValidTarget(target, ERange) then
		      CastSkillShot(_E, target)
	  end
        end
		
	if UniversalMenu.AutoMode.E2:Value() then        
	  if Ready(_E) and ValidTarget(target, ERange) then
		      CastTargetSpell(target,_E)
	  end
        end
		
	if UniversalMenu.AutoMode.E3:Value() then        
	  if Ready(_E) and ValidTarget(target, ERange) then
		      CastSpell(_E)
	  end
        end
		
	if UniversalMenu.AutoMode.E4:Value() then        
	  if Ready(_E) and ValidTarget(target, ERange) then
		      CastSkillShot(_E, target.pos)
	  end
        end
		
		
		
		
        if UniversalMenu.AutoMode.R1:Value() then        
	  if Ready(_R) and ValidTarget(target, RRange) then
		     CastSkillShot(_R, target)
	  end
        end
		
	if UniversalMenu.AutoMode.R2:Value() then        
	  if Ready(_R) and ValidTarget(target, RRange) then
		     CastTargetSpell(target,_R)
	  end
        end
		
	if UniversalMenu.AutoMode.R3:Value() then        
	  if Ready(_R) and ValidTarget(target, RRange) then
		     CastSpell(_R)
	  end
        end
		
	if UniversalMenu.AutoMode.R4:Value() then        
	  if Ready(_R) and ValidTarget(target, RRange) then
		     CastSkillShot(_R, target.pos)
	  end
        end
                
	--AUTO GHOST
	if UniversalMenu.AutoMode.Ghost:Value() then
		if GetCastName(myHero, SUMMONER_1) == "SummonerHaste" and Ready(SUMMONER_1) then
			CastSpell(SUMMONER_1)
		elseif GetCastName(myHero, SUMMONER_2) == "SummonerHaste" and Ready(SUMMONER_2) then
			CastSpell(Summoner_2)
		end
	end




--Auto on minions
    for _, minion in pairs(minionManager.objects) do
			
			   	
        if UniversalMenu.AutoFarm.Q1:Value() and Ready(_Q) and ValidTarget(minion, GetCastRange(myHero,_Q)) and GetCurrentHP(minion) < CalcDamage(myHero,minion,QDmg,Q) then
            CastSkillShot(_Q, minion)
        end

        if UniversalMenu.AutoFarm.Q2:Value() and Ready(_Q) and ValidTarget(minion, GetCastRange(myHero,_Q)) and GetCurrentHP(minion) < CalcDamage(myHero,minion,QDmg,Q) then
             CastTargetSpell(minion, _Q)
        end
  
        if UniversalMenu.AutoFarm.Q3:Value() and Ready(_Q) and ValidTarget(minion, GetCastRange(myHero,_Q)) and GetCurrentHP(minion) < CalcDamage(myHero,minion,QDmg,Q) then
            CastSpell(_Q)
        end
		
	if UniversalMenu.AutoFarm.Q4:Value() and Ready(_Q) and ValidTarget(minion, GetCastRange(myHero,_Q)) and GetCurrentHP(minion) < CalcDamage(myHero,minion,QDmg,Q) then
            CastSkillShot(_Q, target.pos)
        end
     	
     

    

			
        if UniversalMenu.AutoFarm.E1:Value() and Ready(_E) and ValidTarget(minion, GetCastRange(myHero,_W)) and GetCurrentHP(minion) < getdmg("E",minion) then 
            CastSkillShot(_E, minion)
        end

        		
        if UniversalMenu.AutoFarm.E2:Value() and Ready(_E) and ValidTarget(minion, GetCastRange(myHero,_W)) and GetCurrentHP(minion) < getdmg("E",minion) then 
            CastTargetSpell(minion,_E)
        end

        		
        if UniversalMenu.AutoFarm.E3:Value() and Ready(_E) and ValidTarget(minion, GetCastRange(myHero,_W)) and GetCurrentHP(minion) < getdmg("E",minion) then 
            CastSpell(_E)
        end
			
	if UniversalMenu.AutoFarm.E4:Value() and Ready(_E) and ValidTarget(minion, GetCastRange(myHero,_W)) and GetCurrentHP(minion) < getdmg("E",minion) then 
            CastSkillShot(_E, target.pos)
        end
	

        		
        





        if UniversalMenu.AutoFarm.W1:Value() and Ready(_W) and ValidTarget(minion, GetCastRange(myHero,_E)) and GetCurrentHP(minion) < getdmg("W",minion) then 
            CastSkillShot(_W, minion)
        end

        if UniversalMenu.AutoFarm.W2:Value() and Ready(_W) and ValidTarget(minion, GetCastRange(myHero,_E)) and GetCurrentHP(minion) < getdmg("W",minion) then 
            CastTargetSpell(minion,_W)
        end

        if UniversalMenu.AutoFarm.W3:Value() and Ready(_W) and ValidTarget(minion, GetCastRange(myHero,_E)) and GetCurrentHP(minion) < getdmg("W",minion) then 
            CastSpell(_W)
        end
			
	if UniversalMenu.AutoFarm.W4:Value() and Ready(_W) and ValidTarget(minion, GetCastRange(myHero,_E)) and GetCurrentHP(minion) < getdmg("W",minion) then 
            CastSkillShot(_W, target.pos)
        end	

        
			
		
	end   	
       
   
end)





OnProcessSpell(function(unit, spell)
	local target = GetCurrentTarget()        
       
        
        if unit.isMe and spell.name:lower():find("itemtiamatcleave") then
		Mix:ResetAA()
	end	
               
        if unit.isMe and spell.name:lower():find("itemravenoushydracrescent") then
		Mix:ResetAA()
	end

end) 


local function SkinChanger()
	if UniversalMenu.SkinChanger.UseSkinChanger:Value() then
		if SetDCP >= 0  and SetDCP ~= GlobalSkin then
			HeroSkinChanger(myHero, SetDCP)
			GlobalSkin = SetDCP
		end
        end
end


print('<font color = "#01DF01"><b>Universal</b> <font color = "#01DF01">by <font color = "#01DF01"><b>Allwillburn</b> <font color = "#01DF01">Loaded!')





