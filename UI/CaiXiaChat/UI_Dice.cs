/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_Dice : GButton
    {
        public Controller m_c1;
        public Controller m_button;
        public GLoader m_n0;
        public Transition m_t0;
        public const string URL = "ui://gfenp5kwklau107";

        public static UI_Dice CreateInstance()
        {
            return (UI_Dice)UIPackage.CreateObject("CaiXiaChat", "Dice");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_c1 = GetControllerAt(0);
            m_button = GetControllerAt(1);
            m_n0 = (GLoader)GetChildAt(0);
            m_t0 = GetTransitionAt(0);
        }
    }
}