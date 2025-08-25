/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_CaiXiaChatEmojiWindow : GComponent
    {
        public GImage m_n2;
        public GList m_list;
        public const string URL = "ui://gfenp5kwp5qbby";

        public static UI_CaiXiaChatEmojiWindow CreateInstance()
        {
            return (UI_CaiXiaChatEmojiWindow)UIPackage.CreateObject("CaiXiaChat", "CaiXiaChatEmojiWindow");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_n2 = (GImage)GetChildAt(0);
            m_list = (GList)GetChildAt(1);
        }
    }
}