namespace launcher
{
    partial class StartupForm
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            LabelWelcome = new Label();
            LabelSelectLang = new Label();
            BtnCHS = new Button();
            BtnCHT = new Button();
            BtnENG = new Button();
            SuspendLayout();
            // 
            // LabelWelcome
            // 
            LabelWelcome.Font = new Font("Segoe UI", 12F, FontStyle.Bold, GraphicsUnit.Point, 0);
            LabelWelcome.Location = new Point(12, 9);
            LabelWelcome.Name = "LabelWelcome";
            LabelWelcome.Size = new Size(310, 31);
            LabelWelcome.TabIndex = 0;
            LabelWelcome.Text = "欢迎 / 歡迎 / Welcome";
            LabelWelcome.TextAlign = ContentAlignment.MiddleCenter;
            // 
            // LabelSelectLang
            // 
            LabelSelectLang.Location = new Point(12, 40);
            LabelSelectLang.Name = "LabelSelectLang";
            LabelSelectLang.Size = new Size(310, 23);
            LabelSelectLang.TabIndex = 1;
            LabelSelectLang.Text = "请选择语言 / 請選擇語言 / Select a language";
            LabelSelectLang.TextAlign = ContentAlignment.MiddleCenter;
            // 
            // BtnCHS
            // 
            BtnCHS.Location = new Point(12, 79);
            BtnCHS.Name = "BtnCHS";
            BtnCHS.Size = new Size(310, 23);
            BtnCHS.TabIndex = 2;
            BtnCHS.Text = "简体中文";
            BtnCHS.UseVisualStyleBackColor = true;
            // 
            // BtnCHT
            // 
            BtnCHT.Location = new Point(12, 108);
            BtnCHT.Name = "BtnCHT";
            BtnCHT.Size = new Size(310, 23);
            BtnCHT.TabIndex = 3;
            BtnCHT.Text = "繁体中文";
            BtnCHT.UseVisualStyleBackColor = true;
            // 
            // BtnENG
            // 
            BtnENG.Location = new Point(12, 137);
            BtnENG.Name = "BtnENG";
            BtnENG.Size = new Size(310, 23);
            BtnENG.TabIndex = 4;
            BtnENG.Text = "English";
            BtnENG.UseVisualStyleBackColor = true;
            // 
            // StartupForm
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(334, 181);
            Controls.Add(BtnENG);
            Controls.Add(BtnCHT);
            Controls.Add(BtnCHS);
            Controls.Add(LabelSelectLang);
            Controls.Add(LabelWelcome);
            FormBorderStyle = FormBorderStyle.FixedSingle;
            MaximizeBox = false;
            Name = "StartupForm";
            StartPosition = FormStartPosition.CenterScreen;
            Text = "HoYoShade";
            ResumeLayout(false);
        }

        #endregion

        private Label LabelWelcome;
        private Label LabelSelectLang;
        private Button BtnCHS;
        private Button BtnCHT;
        private Button BtnENG;
    }
}
