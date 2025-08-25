/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_DanMu : GLabel
    {
        public GGraph m_n1;
        public GGraph m_n3;
        public GRichTextField m_title;
        public Transition m_t0;
        public const string URL = "ui://gfenp5kwxc8pkb";

        public static UI_DanMu CreateInstance()
        {
            return (UI_DanMu)UIPackage.CreateObject("CaiXiaChat", "DanMu");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_n1 = (GGraph)GetChildAt(0);
            m_n3 = (GGraph)GetChildAt(1);
            m_title = (GRichTextField)GetChildAt(2);
            m_t0 = GetTransitionAt(0);
        }
    }
}