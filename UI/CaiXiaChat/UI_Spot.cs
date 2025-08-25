/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_Spot : GButton
    {
        public Controller m_c1;
        public Controller m_c2;
        public Controller m_c3;
        public Controller m_c4;
        public GLoader m_Airplane;
        public GTextField m_n1;
        public const string URL = "ui://gfenp5kwklau10h";

        public static UI_Spot CreateInstance()
        {
            return (UI_Spot)UIPackage.CreateObject("CaiXiaChat", "Spot");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_c1 = GetControllerAt(0);
            m_c2 = GetControllerAt(1);
            m_c3 = GetControllerAt(2);
            m_c4 = GetControllerAt(3);
            m_Airplane = (GLoader)GetChildAt(0);
            m_n1 = (GTextField)GetChildAt(1);
        }
    }
}