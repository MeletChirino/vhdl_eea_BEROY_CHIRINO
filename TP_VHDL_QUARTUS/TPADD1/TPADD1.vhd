library ieee;
use ieee.std_logic_1164.all;

entity TPADD1 is
    port(
        A1, B1, cin  : in std_logic;
        s1, cout : out std_logic
    );
end TPADD1;

architecture description of TPADD1 is
    
begin
   cout <= (B1 and cin and not A1) or (A1 and cin and not B1) or (A1 and B1 and not cin) or (A1 and B1 and cin);
   
   s1 <= (not A1 and not B1 and cin) or (not A1 and B1 and not cin) or (A1 and not B1 and not cin) or (A1 and B1 and cin);
       
end description;
