
function U = binary_rule(string_rule,k)

format long
Rule = str2num(string_rule); %#ok<ST2NM>
u = dec2bin(Rule);
u = strrep(u,'1','1 ');
u = strrep(u,'0','0 ');
U = str2num(u); %#ok<ST2NM>
if length(U) < 2^(k+1)
    U = [zeros(1,2^(k+1)-length(U)) U];
end
