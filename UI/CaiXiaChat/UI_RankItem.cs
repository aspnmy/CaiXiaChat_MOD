/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_RankItem : GButton
    {
        public Controller m_button;
        public GImage m_n4;
        public GImage m_n5;
        public GTextField m_title;
        public GTextField m_rank;
        public GTextField m_data;
        public const string URL = "ui://gfenp5kwm8szks";

        public static UI_RankItem CreateInstance()
        {
            return (UI_RankItem)UIPackage.CreateObject("CaiXiaChat", "RankItem");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_button = GetControllerAt(0);
            m_n4 = (GImage)GetChildAt(0);
            m_n5 = (GImage)GetChildAt(1);
            m_title = (GTextField)GetChildAt(2);
            m_rank = (GTextField)GetChildAt(3);
            m_data = (GTextField)GetChildAt(4);
        }
    }
}