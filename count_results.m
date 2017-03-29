bdi_count = 0;
bid_count = 0;
dbi_count = 0;
dib_count = 0;
ibd_count = 0;
idb_count = 0;

parameter = total_system_energy_consumed;

for repetition = 1:size(parameter,1)
    
    d = parameter{repetition}{1,1}(rounds);
    b = parameter{repetition}{2,2}(rounds);
    i = parameter{repetition}{3,3}(rounds);
    
    if d > b
        if i > d
            idb_count = idb_count +1;
        else
            if i > b
                dib_count = dib_count +1;
            else
                dbi_count = dbi_count +1;
            end
        end
    else
        if i > d
            if i > b
                ibd_count = ibd_count +1;
            else
                bid_count = bid_count +1;
            end
        else
            bdi_count = bdi_count +1;
        end
    end
            
end