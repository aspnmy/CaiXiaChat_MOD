/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_CaiXiaChatDanMu : GComponent
    {
        public GList m_n0;
        public const string URL = "ui://gfenp5kwxc8pkc";

        public static UI_CaiXiaChatDanMu CreateInstance()
        {
            return (UI_CaiXiaChatDanMu)UIPackage.CreateObject("CaiXiaChat", "CaiXiaChatDanMu");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_n0 = (GList)GetChildAt(0);
        }
    }
}