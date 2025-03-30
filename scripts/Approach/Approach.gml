function Approach(start, _end, shift){

/****************************************
 Increments a value by a given shift but 
 never beyond the end value
 ****************************************/

if (start < _end)
    return min(start + shift, _end); 
else
    return max(start - shift, _end);
}
