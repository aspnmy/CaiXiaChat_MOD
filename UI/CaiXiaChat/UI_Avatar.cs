/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_Avatar : GButton
    {
        public Controller m_button;
        public GImage m_n2;
        public GLoader m_icon;
        public const string URL = "ui://gfenp5kwzr2bzj";

        public static UI_Avatar CreateInstance()
        {
            return (UI_Avatar)UIPackage.CreateObject("CaiXiaChat", "Avatar");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_button = GetControllerAt(0);
            m_n2 = (GImage)GetChildAt(0);
            m_icon = (GLoader)GetChildAt(1);
        }
    }
}