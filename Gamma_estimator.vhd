----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity Gamma_estimator is
port(  input: in std_logic_vector(7 downto 0);
       nrst : in std_logic;
		 clk : in std_logic;
		 enable : out std_logic;
		 gamma: out std_logic_vector(7 downto 0) 
		 );
end Gamma_estimator;

architecture Behavioral of Gamma_estimator is

signal sum_of_brightness : std_logic_vector(15 downto 0) :="0000000000000000";
signal average_of_brightness : std_logic_vector(7 downto 0);
signal counter : integer:=0;
signal flag : std_logic;
begin
process(clk)
variable gamma_temp : std_logic_vector(7 downto 0);
begin
  if(nrst = '1') then
    counter <= 0;
	 sum_of_brightness <= "0000000000000000"; 
	 average_of_brightness <="00000000";
	 flag <= '0';
  elsif(rising_edge(clk)) then
	 sum_of_brightness <= input + sum_of_brightness;
	 counter <= counter+ 1;
	 if (counter = 256) then
	 counter <= 0;
	 sum_of_brightness <= "0000000000000000";
    gamma <= sum_of_brightness(15 downto 8);
    enable <= '1';	 
	 end if;
 end if;
end process;
end Behavioral;

