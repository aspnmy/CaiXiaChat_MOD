/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_NewMessageTip : GLabel
    {
        public GGraph m_n2;
        public GTextField m_title;
        public Transition m_t0;
        public const string URL = "ui://gfenp5kwmv8yl4";

        public static UI_NewMessageTip CreateInstance()
        {
            return (UI_NewMessageTip)UIPackage.CreateObject("CaiXiaChat", "NewMessageTip");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_n2 = (GGraph)GetChildAt(0);
            m_title = (GTextField)GetChildAt(1);
            m_t0 = GetTransitionAt(0);
        }
    }
}