/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_SideOpenButton : GButton
    {
        public Controller m_button;
        public GImage m_n0;
        public const string URL = "ui://gfenp5kwkddn10v";

        public static UI_SideOpenButton CreateInstance()
        {
            return (UI_SideOpenButton)UIPackage.CreateObject("CaiXiaChat", "SideOpenButton");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_button = GetControllerAt(0);
            m_n0 = (GImage)GetChildAt(0);
        }
    }
}