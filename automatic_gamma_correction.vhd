----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:36:19 01/15/2016 
-- Design Name: 
-- Module Name:    automatic_gamma_correction - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity automatic_gamma_correction is
 port( input: in std_logic_vector(7 downto 0);
       nrst : in std_logic;
		 clk : in std_logic;
       output : out std_logic_vector (7 downto 0)		 
		 );
end automatic_gamma_correction;


architecture Behavioral of automatic_gamma_correction is

COMPONENT gamma_correction IS
port(  input: in std_logic_vector(7 downto 0);
       nrst : in std_logic;
		 clk : in std_logic;
		 enable : in std_logic;
		 gamma: in std_logic_vector(7 downto 0);
       output : out std_logic_vector (7 downto 0)		 
		 );
END COMPONENT;

COMPONENT Gamma_estimator is
port(  input: in std_logic_vector(7 downto 0);
       nrst : in std_logic;
		 clk : in std_logic;
		 enable : out std_logic;
		 gamma: out std_logic_vector(7 downto 0) 
		 );
END COMPONENT;


signal gamma : std_logic_vector(7 downto 0);
signal enable : std_logic;
begin

gamma_estimator_module : Gamma_estimator PORT MAP ( input       => input,
                                             nrst => nrst,
                                             clk => clk,
															enable => enable,
                                             gamma   => gamma  
                                             );
															
gamma_correction_module : gamma_correction PORT MAP ( input => input,
                                               nrst => nrst,
                                               clk => clk,
															  enable => enable,
                                               gamma   => gamma,
															  output => output
                                             );


end Behavioral;

