<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ParcoursProo.aspx.cs" Inherits="ParcoursProo" %>

<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Effectif Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Manrope', sans-serif;
            background: linear-gradient(135deg, #dbeafe, #ffedd5);
            margin: 0;
            padding: 24px;
            color: #1f2937;
            overflow-x: hidden;
            position: relative;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: flex-start;
        }

        #particle-canvas {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            pointer-events: none;
            opacity: 0.3;
        }

        #form1 {
            width: 100%;
            padding: 0;
            min-height: auto;
            animation: fadeIn 0.6s ease-out;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .dxgvTable_Glass {
            border-collapse: collapse !important;
            background: #ffffff !important;
            border-radius: 12px !important;
            box-shadow: 0 6px 24px rgba(0, 0, 0, 0.1) !important;
            display: table !important;
            visibility: visible !important;
            transition: transform 0.3s ease !important;
            width: 100% !important;
            table-layout: fixed !important;
        }

            .dxgvTable_Glass:hover {
                transform: translateY(-2px) !important;
            }

        .dxgvHeader_Glass {
            background: linear-gradient(135deg, #2563eb, #1e40af) !important;
            color: #ffffff !important;
            font-weight: 700 !important;
            font-size: 14px !important;
            padding: 14px !important;
            border: none !important;
            text-transform: uppercase !important;
            letter-spacing: 1.2px !important;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15) !important;
            position: relative !important;
            overflow: hidden !important;
            transition: background 0.3s ease, transform 0.2s ease !important;
            text-align: center !important;
        }

            .dxgvHeader_Glass:hover {
                background: linear-gradient(135deg, #1e40af, #2563eb) !important;
                transform: translateY(-1px) !important;
            }

            .dxgvHeader_Glass::before {
                content: '';
                position: absolute;
                top: 0;
                left: -100%;
                width: 100%;
                height: 100%;
                background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
                transition: 0.5s;
            }

            .dxgvHeader_Glass:hover::before {
                left: 100%;
            }

            .dxgvHeader_Glass::after {
                content: '';
                position: absolute;
                bottom: 0;
                left: 0;
                width: 100%;
                height: 3px;
                background: #f97316;
                transition: transform 0.3s ease;
            }

        .dxgvDataRow_Glass td {
            padding: 12px !important;
            font-size: 14px !important;
            line-height: 1.4 !important;
            color: #1f2937 !important;
            border-bottom: 1px solid #e5e7eb !important;
            transition: background-color 0.2s ease, color 0.2s ease !important;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .dxgvDataRow_Glass:hover td {
            background-color: #ffedd5 !important;
            color: #7c2d12 !important;
        }

        .dxflGroupBox_Glass {
            border-radius: 12px !important;
            background: #ffffff !important;
            box-shadow: 0 6px 24px rgba(0, 0, 0, 0.1) !important;
            margin-bottom: 20px !important;
        }

        .dxflGroupBoxCaption_Glass {
            background: linear-gradient(135deg, #2563eb, #1e40af) !important;
            color: #ffffff !important;
            font-weight: 700 !important;
            font-size: 14px !important;
            padding: 12px !important;
            border-radius: 12px 12px 0 0 !important;
            text-transform: uppercase !important;
        }

        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            width: 100%;
        }

        .dashboard-header-title {
            font-size: 24px;
            font-weight: 700;
            color: #2563eb;
            display: flex;
            align-items: center;
            gap: 12px;
            animation: slideIn 0.8s ease-out;
            position: relative;
            padding-bottom: 6px;
        }

            .dashboard-header-title::after {
                content: '';
                position: absolute;
                bottom: 0;
                left: 0;
                width: 50%;
                height: 2px;
                background: linear-gradient(to right, #2563eb, #f97316);
                border-radius: 2px;
            }

        .metric-table {
            width: 350px;
            text-align: center;
            font-size: 14px;
            font-weight: 700;
            padding: 25px;
            color: #1f2937;
            border-radius: 12px;
            background: #f8fafc;
            box-shadow: 0 6px 24px rgba(0, 0, 0, 0.1);
            margin: 0 auto;
        }

        .metric-value-male {
            text-align: center;
            color: white;
            border-radius: 8px;
            background: linear-gradient(to right, #6b7280, #9ca3af);
            padding: 6px;
        }

        .metric-value-female {
            text-align: center;
            color: white;
            border-radius: 8px;
            background: linear-gradient(to right, #2563eb, #3b82f6);
            padding: 6px;
        }

        .dxeBase_Glass {
            font-family: 'Manrope', sans-serif !important;
            font-size: 14px !important;
            color: #1f2937 !important;
        }

        .chart-container {
            max-width: 100%;
            height: 300px;
            margin: 20px auto;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(12px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateX(-20px);
            }

            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        @media (max-width: 1024px) {
            .dxflFormLayout_Glass {
                column-count: 2 !important;
            }

            .dxflGroupBox_Glass {
                width: 100% !important;
            }

            .metric-table {
                width: 100%;
            }

            .chart-container {
                height: 250px;
            }
        }

        @media (max-width: 768px) {
            body {
                padding: 16px;
            }

            #form1 {
                padding: 0;
            }

            .dashboard-header-title {
                font-size: 20px;
            }

            .metric-table {
                width: 100%;
                padding: 16px;
            }

            .dxflFormLayout_Glass {
                column-count: 1 !important;
            }

            .dxgvHeader_Glass {
                font-size: 12px !important;
                padding: 10px !important;
            }

            .dxgvDataRow_Glass td {
                font-size: 13px !important;
                padding: 8px !important;
            }

            .chart-container {
                height: 200px;
            }
        }

        @media (max-width: 480px) {
            body {
                padding: 12px;
            }

            #form1 {
                padding: 0;
            }

            .dashboard-header-title {
                font-size: 18px;
            }

            .metric-table {
                width: 100%;
                padding: 12px;
            }

            .dxgvHeader_Glass {
                font-size: 11px !important;
                padding: 8px !important;
            }

            .dxgvDataRow_Glass td {
                font-size: 12px !important;
                padding: 6px !important;
            }

            .chart-container {
                height: 180px;
            }
        }
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Particle Background
            const canvas = document.getElementById('particle-canvas');
            const ctx = canvas.getContext('2d');
            canvas.width = window.innerWidth;
            canvas.height = window.innerHeight;

            let particlesArray = [];
            const numberOfParticles = 50;
            let mouse = { x: null, y: null, radius: 100 };

            window.addEventListener('mousemove', function (event) {
                mouse.x = event.x;
                mouse.y = event.y;
            });

            class Particle {
                constructor() {
                    this.x = Math.random() * canvas.width;
                    this.y = Math.random() * canvas.height;
                    this.size = Math.random() * 5 + 1;
                    this.speedX = Math.random() * 3 - 1.5;
                    this.speedY = Math.random() * 3 - 1.5;
                    this.color = `rgba(${Math.random() * 255}, ${Math.random() * 255}, ${Math.random() * 255}, 0.7)`;
                }

                update() {
                    this.x += this.speedX;
                    this.y += this.speedY;
                    if (this.x + this.size > canvas.width || this.x - this.size < 0) {
                        this.speedX = -this.speedX;
                    }
                    if (this.y + this.size > canvas.height || this.y - this.size < 0) {
                        this.speedY = -this.speedY;
                    }
                    let dx = mouse.x - this.x;
                    let dy = mouse.y - this.y;
                    let distance = Math.sqrt(dx * dx + dy * dy);
                    if (distance < mouse.radius) {
                        let force = (mouse.radius - distance) / mouse.radius;
                        let angle = Math.atan2(dy, dx);
                        this.speedX -= Math.cos(angle) * force * 2;
                        this.speedY -= Math.sin(angle) * force * 2;
                    }
                }

                draw() {
                    ctx.fillStyle = this.color;
                    ctx.beginPath();
                    ctx.arc(this.x, this.y, this.size, 0, Math.PI * 2);
                    ctx.fill();
                }
            }

            function init() {
                particlesArray = [];
                for (let i = 0; i < numberOfParticles; i++) {
                    particlesArray.push(new Particle());
                }
            }

            function animate() {
                ctx.clearRect(0, 0, canvas.width, canvas.height);
                for (let i = 0; i < particlesArray.length; i++) {
                    particlesArray[i].update();
                    particlesArray[i].draw();
                    for (let j = i + 1; j < particlesArray.length; j++) {
                        let dx = particlesArray[i].x - particlesArray[j].x;
                        let dy = particlesArray[i].y - particlesArray[j].y;
                        let distance = Math.sqrt(dx * dx + dy * dy);
                        if (distance < 100) {
                            ctx.strokeStyle = `rgba(37, 99, 235, ${1 - distance / 100})`;
                            ctx.lineWidth = 1;
                            ctx.beginPath();
                            ctx.moveTo(particlesArray[i].x, particlesArray[i].y);
                            ctx.lineTo(particlesArray[j].x, particlesArray[j].y);
                            ctx.stroke();
                        }
                    }
                }
                requestAnimationFrame(animate);
            }

            init();
            animate();

            window.addEventListener('resize', function () {
                canvas.width = window.innerWidth;
                canvas.height = window.innerHeight;
                init();
            });

            // Fetch Chart Data via AJAX
            function initializeCharts() {
                // Contrat de Travail
                $.ajax({
                    url: 'Effectif.aspx/GetContractData',
                    method: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify({}),
                    success: function (response) {
                        const data = JSON.parse(response.d);
                        const contractData = {
                            labels: data.map(item => item.Description),
                            datasets: [{
                                label: 'Contrat de Travail 2025',
                                data: data.map(item => item.NbrN),
                                backgroundColor: ['#2563eb', '#f97316', '#22c55e']
                            }]
                        };
                        new Chart(document.getElementById('contractChart'), {
                            type: 'bar',
                            data: contractData,
                            options: {
                                responsive: true,
                                maintainAspectRatio: false,
                                scales: { y: { beginAtZero: true } }
                            }
                        });
                    },
                    error: function () {
                        console.error('Failed to fetch contract data');
                    }
                });

                // Sexe
                $.ajax({
                    url: 'Effectif.aspx/GetSexeData',
                    method: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify({}),
                    success: function (response) {
                        const data = JSON.parse(response.d);
                        const sexData = {
                            labels: data.map(item => item.Sexe),
                            datasets: [{
                                label: 'Sexe 2025',
                                data: data.map(item => item['2025']),
                                backgroundColor: ['#6b7280', '#2563eb']
                            }]
                        };
                        new Chart(document.getElementById('sexChart'), {
                            type: 'pie',
                            data: sexData,
                            options: {
                                responsive: true,
                                maintainAspectRatio: false
                            }
                        });
                    },
                    error: function () {
                        console.error('Failed to fetch sexe data');
                    }
                });

                // Tranche d'age
                $.ajax({
                    url: 'Effectif.aspx/GetAgeData',
                    method: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify({}),
                    success: function (response) {
                        const data = JSON.parse(response.d);
                        const ageData = {
                            labels: data.map(item => item.TrancheAge),
                            datasets: [{
                                label: 'Tranche d\'age 2025',
                                data: data.map(item => item['2025']),
                                backgroundColor: ['#2563eb', '#f97316', '#22c55e', '#9ca3af', '#dc2626']
                            }]
                        };
                        new Chart(document.getElementById('ageChart'), {
                            type: 'bar',
                            data: ageData,
                            options: {
                                responsive: true,
                                maintainAspectRatio: false,
                                scales: { y: { beginAtZero: true } }
                            }
                        });
                    },
                    error: function () {
                        console.error('Failed to fetch age data');
                    }
                });
            }

            initializeCharts();
        });
    </script>
</head>
<body>
    <canvas id="particle-canvas"></canvas>
    <form id="form1" runat="server">
        <div class="dashboard-header">
            <div class="dashboard-header-title">
                <span>Parcours Pro</span>
            </div>
        </div>

        <dx:ASPxFormLayout ID="FormEffectif" runat="server" EnableViewState="false" EncodeHtml="false" RequiredMarkDisplayMode="RequiredOnly" ColumnCount="4" Theme="Glass" Width="100%">
            <Items>
                <dx:LayoutGroup Caption="Embauche" GroupBoxStyle-Caption-Font-Bold="true" Width="25%">
                    <Items>
                        <dx:LayoutItem Caption="" Width="100%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxGridView ID="GridContract" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridContract" Theme="Glass"
                                        Width="100%" KeyFieldName="ID" DataSourceID="sqlcontrat">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataComboBoxColumn FieldName="Type_Contrat" Caption="Contrat de Travail" Width="40%">
                                                <PropertiesComboBox DataSourceID="SqlTC" TextField="Description" ValueField="ID">
                                                    <ValidationSettings RequiredField-IsRequired="true" />
                                                </PropertiesComboBox>
                                            </dx:GridViewDataComboBoxColumn>
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2025" Caption="2025" VisibleIndex="2" Width="20%" />
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2024" Caption="2024" VisibleIndex="3" Width="20%" />
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2023" Caption="2023" VisibleIndex="4" Width="20%" />
                                        </Columns>
                                        <SettingsResizing ColumnResizeMode="NextColumn" />
                                        <SettingsSearchPanel Visible="false" />
                                        <SettingsPager Visible="false" />
                                        <Settings ShowTitlePanel="false" ShowGroupPanel="false" ShowColumnHeaders="true" ShowFilterRow="false"
                                            VerticalScrollBarMode="Visible" VerticalScrollableHeight="120" />
                                    </dx:ASPxGridView>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption=" " Width="100%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxGridView ID="GridDepartement" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridDepartement" Theme="Glass"
                                        Width="100%" KeyFieldName="ID" DataSourceID="sqldep">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataComboBoxColumn FieldName="Departement" Caption="Département" Width="40%">
                                                <PropertiesComboBox DataSourceID="SqlDeep" TextField="Description" ValueField="ID">
                                                    <ValidationSettings RequiredField-IsRequired="true" />
                                                </PropertiesComboBox>
                                            </dx:GridViewDataComboBoxColumn>
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2025" Caption="2025" VisibleIndex="2" Width="20%" />
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2024" Caption="2024" VisibleIndex="3" Width="20%" />
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2023" Caption="2023" VisibleIndex="4" Width="20%" />
                                        </Columns>
                                        <SettingsResizing ColumnResizeMode="NextColumn" />
                                        <SettingsSearchPanel Visible="false" />
                                        <SettingsPager Visible="false" />
                                        <Settings ShowTitlePanel="false" ShowGroupPanel="false" ShowColumnHeaders="true" ShowFilterRow="false"
                                            VerticalScrollBarMode="Visible" VerticalScrollableHeight="120" />
                                    </dx:ASPxGridView>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption=" " Width="100%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxGridView ID="GridCategorie" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridCategorie" Theme="Glass"
                                        Width="100%" KeyFieldName="Id" DataSourceID="SqlFA">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Fonction" Caption="Catégorie professionnelle" VisibleIndex="1" Width="40%"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2025" Caption="2025" VisibleIndex="2" Width="20%" />
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2024" Caption="2024" VisibleIndex="3" Width="20%" />
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2023" Caption="2023" VisibleIndex="4" Width="20%" />
                                        </Columns>
                                        <SettingsResizing ColumnResizeMode="NextColumn" />
                                        <SettingsSearchPanel Visible="false" />
                                        <SettingsPager Visible="false" />
                                        <Settings ShowTitlePanel="false" ShowGroupPanel="false" ShowColumnHeaders="true" ShowFilterRow="false"
                                            VerticalScrollBarMode="Visible" VerticalScrollableHeight="120" />
                                    </dx:ASPxGridView>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption=" " Width="100%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxGridView ID="GridSexe" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridSexe" Theme="Glass"
                                        Width="100%" KeyFieldName="ID" DataSourceID="SqlSexe">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Sexe" Caption="Sexe" VisibleIndex="1" Width="40%"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2025" Caption="2025" VisibleIndex="2" Width="20%" />
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2024" Caption="2024" VisibleIndex="3" Width="20%" />
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2023" Caption="2023" VisibleIndex="4" Width="20%" />
                                        </Columns>
                                        <SettingsResizing ColumnResizeMode="NextColumn" />
                                        <SettingsSearchPanel Visible="false" />
                                        <SettingsPager Visible="false" />
                                        <Settings ShowTitlePanel="false" ShowGroupPanel="false" ShowColumnHeaders="true" ShowFilterRow="false"
                                            VerticalScrollBarMode="Visible" VerticalScrollableHeight="120" />
                                    </dx:ASPxGridView>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                </dx:LayoutGroup>
                <dx:LayoutGroup Caption="Depart" GroupBoxStyle-Caption-Font-Bold="true" Width="25%">
                    <Items>
                        <dx:LayoutItem Caption=" " Width="100%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxGridView ID="GridDepartFonction" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridDepartFonction" Theme="Glass"
                                        Width="100%" KeyFieldName="Id" DataSourceID="SqlDF">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Fonction" Caption="Catégorie Professionelle" VisibleIndex="1" Width="40%"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2025" Caption="2025" VisibleIndex="2" Width="20%" />
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2024" Caption="2024" VisibleIndex="3" Width="20%" />
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2023" Caption="2023" VisibleIndex="4" Width="20%" />
                                        </Columns>
                                        <SettingsResizing ColumnResizeMode="NextColumn" />
                                        <SettingsSearchPanel Visible="false" />
                                        <SettingsPager Visible="false" />
                                        <Settings ShowTitlePanel="false" ShowGroupPanel="false" ShowColumnHeaders="true" ShowFilterRow="false"
                                            VerticalScrollBarMode="Visible" VerticalScrollableHeight="120" />
                                    </dx:ASPxGridView>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption=" " Width="100%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxGridView ID="GridDepartDepartement" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridDepartDepartement" Theme="Glass"
                                        Width="100%" KeyFieldName="ID" DataSourceID="SqlDD">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Departement" Caption="Département" VisibleIndex="1" Width="40%"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2025" Caption="2025" VisibleIndex="2" Width="20%" />
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2024" Caption="2024" VisibleIndex="3" Width="20%" />
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2023" Caption="2023" VisibleIndex="4" Width="20%" />
                                        </Columns>
                                        <SettingsResizing ColumnResizeMode="NextColumn" />
                                        <SettingsSearchPanel Visible="false" />
                                        <SettingsPager Visible="false" />
                                        <Settings ShowTitlePanel="false" ShowGroupPanel="false" ShowColumnHeaders="true" ShowFilterRow="false"
                                            VerticalScrollBarMode="Visible" VerticalScrollableHeight="120" />
                                    </dx:ASPxGridView>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption=" " Width="100%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxGridView ID="GridSexeDepart" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridSexeDepart" Theme="Glass"
                                        Width="100%" KeyFieldName="ID" DataSourceID="SqlSD">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Sexe" Caption="Sexe" VisibleIndex="1" Width="40%"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2025" Caption="2025" VisibleIndex="2" Width="20%" />
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2024" Caption="2024" VisibleIndex="3" Width="20%" />
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2023" Caption="2023" VisibleIndex="4" Width="20%" />
                                        </Columns>
                                        <SettingsResizing ColumnResizeMode="NextColumn" />
                                        <SettingsSearchPanel Visible="false" />
                                        <SettingsPager Visible="false" />
                                        <Settings ShowTitlePanel="false" ShowGroupPanel="false" ShowColumnHeaders="true" ShowFilterRow="false"
                                            VerticalScrollBarMode="Visible" VerticalScrollableHeight="120" />
                                    </dx:ASPxGridView>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                </dx:LayoutGroup>
                <dx:LayoutGroup Caption="Mouvement" GroupBoxStyle-Caption-Font-Bold="true" Width="25%">
                    <Items>
                        <dx:LayoutItem ShowCaption="False">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxGridView ID="GridMv" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridMv" Theme="Glass"
                                        Width="100%" KeyFieldName="Id" DataSourceID="SqlTemp">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Type_Mouvement" Caption="Type Mouvement" VisibleIndex="1" Width="40%"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2025" Caption="2025" VisibleIndex="2" Width="20%" />
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2024" Caption="2024" VisibleIndex="3" Width="20%" />
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2023" Caption="2023" VisibleIndex="4" Width="20%" />
                                        </Columns>
                                        <SettingsResizing ColumnResizeMode="NextColumn" />
                                        <SettingsSearchPanel Visible="false" />
                                        <SettingsPager Visible="false" />
                                        <Settings ShowTitlePanel="false" ShowGroupPanel="false" ShowColumnHeaders="true" ShowFilterRow="false"
                                            VerticalScrollBarMode="Visible" VerticalScrollableHeight="120" />
                                    </dx:ASPxGridView>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem ShowCaption="False">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxGridView ID="GridFonctionMouvement" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridFonctionMouvement" Theme="Glass"
                                        Width="100%" KeyFieldName="Id" DataSourceID="SqlNA">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Fonction" Caption="Catégorie Professionelle" VisibleIndex="1" Width="40%"></dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn FieldName="Type_Mouvement" Caption="Type Mouvement" VisibleIndex="1" Width="40%"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2025" Caption="2025" VisibleIndex="2" Width="13%" />
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2024" Caption="2024" VisibleIndex="3" Width="13%" />
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2023" Caption="2023" VisibleIndex="4" Width="13%" />
                                        </Columns>
                                        <SettingsResizing ColumnResizeMode="NextColumn" />
                                        <SettingsSearchPanel Visible="false" />
                                        <SettingsPager Visible="false" />
                                        <Settings ShowTitlePanel="false" ShowGroupPanel="false" ShowColumnHeaders="true" ShowFilterRow="false"
                                            VerticalScrollBarMode="Visible" VerticalScrollableHeight="120" />
                                    </dx:ASPxGridView>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                </dx:LayoutGroup>
                <dx:LayoutGroup Caption="Sanctions" GroupBoxStyle-Caption-Font-Bold="true" Width="25%">
                    <Items>
                        <dx:LayoutItem Caption=" " Width="100%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxGridView ID="GridSanction" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridSan" Theme="Glass"
                                        Width="100%" KeyFieldName="Id" DataSourceID="SqlSan">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Type_Sanction" Caption=" Type Sanction" VisibleIndex="1" Width="40%"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2025" Caption="2025" VisibleIndex="2" Width="20%" />
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2024" Caption="2024" VisibleIndex="3" Width="20%" />
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2023" Caption="2023" VisibleIndex="4" Width="20%" />
                                        </Columns>
                                        <SettingsResizing ColumnResizeMode="NextColumn" />
                                        <SettingsSearchPanel Visible="false" />
                                        <SettingsPager Visible="false" />
                                        <Settings ShowTitlePanel="false" ShowGroupPanel="false" ShowColumnHeaders="true" ShowFilterRow="false"
                                            VerticalScrollBarMode="Visible" VerticalScrollableHeight="120" />
                                    </dx:ASPxGridView>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption=" " Width="100%">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxGridView ID="GridSanF" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridSanF" Theme="Glass"
                                        Width="100%" KeyFieldName="ID" DataSourceID="SqlSanF">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="0" ReadOnly="True" Visible="false"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Fonction" Caption="Catégorie Professionelle" VisibleIndex="1" Width="40%"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Type_Sanction" Caption="Type Sanction" VisibleIndex="1" Width="40%"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2025" Caption="2025" VisibleIndex="2" Width="20%" />
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2024" Caption="2024" VisibleIndex="3" Width="20%" />
                                            <dx:GridViewDataTextColumn FieldName="Nbr_2023" Caption="2023" VisibleIndex="4" Width="20%" />
                                        </Columns>
                                        <SettingsResizing ColumnResizeMode="NextColumn" />
                                        <SettingsSearchPanel Visible="false" />
                                        <SettingsPager Visible="false" />
                                        <Settings ShowTitlePanel="false" ShowGroupPanel="false" ShowColumnHeaders="true" ShowFilterRow="false"
                                            VerticalScrollBarMode="Visible" VerticalScrollableHeight="120" />
                                    </dx:ASPxGridView>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>

                    </Items>
                </dx:LayoutGroup>

            </Items>
        </dx:ASPxFormLayout>

        <asp:SqlDataSource ID="SqlDF" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="Depart_Fonction" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="sqlcontrat" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="Embauce_Contrat" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlTC" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="SelectType_Contrat" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlDeep" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="SelectDepartements" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlDep" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="Embauce_Departement" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlSexe" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="Embauce_Sexe" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlDD" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="Depart_Departement" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlSD" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="Depart_Sexe" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlNA" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="Fonction_Mouvement" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlFA" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="Embauce_Fonction" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlTemp" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="Type_Mouvement" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlSan" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="Afficher_Sanction" SelectCommandType="StoredProcedure" />
        <asp:SqlDataSource ID="SqlSanF" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="Afficher_SanctionFonction" SelectCommandType="StoredProcedure" />
    </form>
</body>
</html>
