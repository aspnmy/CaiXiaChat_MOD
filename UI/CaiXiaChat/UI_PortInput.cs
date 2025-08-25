/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_PortInput : GLabel
    {
        public Controller m_c1;
        public Controller m_grayed;
        public GImage m_n0;
        public GGraph m_holder;
        public GTextInput m_title;
        public const string URL = "ui://gfenp5kwsm1yg";

        public static UI_PortInput CreateInstance()
        {
            return (UI_PortInput)UIPackage.CreateObject("CaiXiaChat", "PortInput");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_c1 = GetControllerAt(0);
            m_grayed = GetControllerAt(1);
            m_n0 = (GImage)GetChildAt(0);
            m_holder = (GGraph)GetChildAt(1);
            m_title = (GTextInput)GetChildAt(2);
        }
    }
}