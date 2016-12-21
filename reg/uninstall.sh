#!/bin/dash -e
REG DELETE 'HKCR\CSSfile\shell' /f
REG DELETE 'HKCR\FirefoxHTML\shell' /f
REG DELETE 'HKCR\inifile\shell' /f
REG DELETE 'HKCR\JSFile\shell' /f
REG DELETE 'HKCR\txtfile\shell' /f
REG DELETE 'HKCR\Unknown\shell' /f
