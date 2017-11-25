
Grant full control of aero.msstyles:

~~~sh
cd 'C:\Windows\Resources\Themes\Aero'
TAKEOWN /F aero.msstyles
ICACLS aero.msstyles /grant Users:F
mv aero.msstyles aero-old.msstyles
~~~

- http://anolis.codeplex.com
- http://support.microsoft.com?id=269269
- http://winmatrix.com/forums/index.php?topic/14250-tutorial-hex-editing-vista-visual-styles
