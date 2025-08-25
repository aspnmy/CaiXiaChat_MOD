/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_AcutionInfo : GLabel
    {
        public GRichTextField m_title;
        public Transition m_Timer;
        public const string URL = "ui://gfenp5kwem56kl";

        public static UI_AcutionInfo CreateInstance()
        {
            return (UI_AcutionInfo)UIPackage.CreateObject("CaiXiaChat", "AcutionInfo");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_title = (GRichTextField)GetChildAt(0);
            m_Timer = GetTransitionAt(0);
        }
    }
}