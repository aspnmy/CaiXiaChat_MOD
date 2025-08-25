/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_IconTextButton : GButton
    {
        public Controller m_button;
        public GImage m_n7;
        public GLoader m_icon;
        public GTextField m_title;
        public GTextField m_prefix;
        public const string URL = "ui://gfenp5kw9b2h3";

        public static UI_IconTextButton CreateInstance()
        {
            return (UI_IconTextButton)UIPackage.CreateObject("CaiXiaChat", "IconTextButton");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_button = GetControllerAt(0);
            m_n7 = (GImage)GetChildAt(0);
            m_icon = (GLoader)GetChildAt(1);
            m_title = (GTextField)GetChildAt(2);
            m_prefix = (GTextField)GetChildAt(3);
        }
    }
}