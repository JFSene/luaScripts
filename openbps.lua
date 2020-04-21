local CLOCK
local gptimer=os.clock()-.40
-- bp id list in order to open (if found)
local backpacks = { 3253, 5949, 2869, 8860, 2854, 2872,
                    9605, 9601, 10326, 10324, 7342, 2871,
                    2865, 2870, 10202, 5801, 10327, 9604,
                    3244, 9602, 5926, 2868, 2867, 10346,
                    2866 } -- this is ordered by name asc
                    
function opennewbp()
   CLOCK=os.clock()
   if (CLOCK-gptimer<2.2) then return 0; end
   gptimer=CLOCK
    
   if (MAXCONTAINERS>0) then
       local j=1
       while (j<MAXCONTAINERS+1) do
            if (conts[j].numitems>18) then
                local i=1
                while (i<conts[j].numitems+1) do
                    local item=conts[j].items[i].id
                    -- it will open according to id list
                    for _,bpid in pairs(backpacks) do
                        if bpid == item then
                            UseContainerItem(conts[j].contnum,i-1,item)
                            return
                        end
                    end
                    
                    i=i+1
                    
                end
            end
            j=j+1
       end
   end
end
   
SetTimerCallback("opennewbp")