/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_PlayerAvatar : GButton
    {
        public Controller m_c1;
        public GLoader m_icon;
        public GTextField m_n4;
        public GTextField m_n5;
        public Transition m_t0;
        public const string URL = "ui://gfenp5kwifju10q";

        public static UI_PlayerAvatar CreateInstance()
        {
            return (UI_PlayerAvatar)UIPackage.CreateObject("CaiXiaChat", "PlayerAvatar");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_c1 = GetControllerAt(0);
            m_icon = (GLoader)GetChildAt(0);
            m_n4 = (GTextField)GetChildAt(1);
            m_n5 = (GTextField)GetChildAt(2);
            m_t0 = GetTransitionAt(0);
        }
    }
}