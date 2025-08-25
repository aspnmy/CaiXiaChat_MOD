/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_Emoji : GButton
    {
        public Controller m_button;
        public GLoader m_icon;
        public const string URL = "ui://gfenp5kwp5qbha";

        public static UI_Emoji CreateInstance()
        {
            return (UI_Emoji)UIPackage.CreateObject("CaiXiaChat", "Emoji");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_button = GetControllerAt(0);
            m_icon = (GLoader)GetChildAt(0);
        }
    }
}