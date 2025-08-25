/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_CaiXiaChatMiniChatWindow : GComponent
    {
        public UI_MiniChat m_frame;
        public const string URL = "ui://gfenp5kwtrnyzy";

        public static UI_CaiXiaChatMiniChatWindow CreateInstance()
        {
            return (UI_CaiXiaChatMiniChatWindow)UIPackage.CreateObject("CaiXiaChat", "CaiXiaChatMiniChatWindow");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_frame = (UI_MiniChat)GetChildAt(0);
        }
    }
}