function gerarCertificado(nome, sobrenome, curso, carga, dataHoje) {

    const { Document, Paragraph, TextRun, AlignmentType, PageOrientation, Packer } = docx;

    const doc = new Document({
        sections: [{
            properties: {
                page: {
                    size: {
                        width: 11906,  // 21cm em twips
                        height: 8505   // 15cm em twips
                    },
                    margin: {
                        top: 1000,
                        right: 1000,
                        bottom: 1000,
                        left: 1000,
                    },
                },
            },
            children: [
                new Paragraph({
                    alignment: AlignmentType.CENTER,
                    spacing: { after: 600 },
                    children: [
                        new TextRun({
                            text: "CERTIFICADO",
                            bold: true,
                            size: 36,
                            font: "Constantia",
                            color: "0D6EF6"
                        }),
                    ],
                }),

                new Paragraph({
                    alignment: AlignmentType.CENTER,
                    spacing: { after: 400, line: 300 },
                    children: [
                        new TextRun({
                            text: "Certificamos que o Sr.(a) ",
                            size: 20,
                            font: "Arial",
                        }),
                        new TextRun({
                            text: nome,
                            size: 20,
                            bold: true,
                            font: "Arial",
                        }),
                        new TextRun({
                            text: " " + sobrenome,
                            size: 20,
                            bold: true,
                            font: "Arial",
                        }),
                        new TextRun({
                            text: " concluiu o curso de ",
                            size: 20,
                            font: "Arial",
                        }),
                        new TextRun({
                            text: curso,
                            size: 20,
                            bold: true,
                            font: "Arial",
                        }),
                        new TextRun({
                            text: " da plataforma AprendAI com carga horária total de ",
                            size: 20,
                            font: "Arial",
                        }),
                        new TextRun({
                            text: carga,
                            size: 20,
                            bold: true,
                            font: "Arial",
                        }),
                        new TextRun({
                            text: " horas.",
                            size: 20,
                            font: "Arial",
                        }),
                    ],
                }),

                new Paragraph({
                    spacing: { after: 400 },
                    children: [],
                }),

                new Paragraph({
                    alignment: AlignmentType.RIGHT,
                    spacing: { after: 800 },
                    children: [
                        new TextRun({
                            text: dataHoje + ".",
                            size: 18,
                            font: "Arial",
                        }),
                    ],
                }),

                new Paragraph({
                    alignment: AlignmentType.CENTER,
                    spacing: { before: 800, after: 200 },
                    children: [
                        new TextRun({
                            text: "___________________________________________",
                            size: 16,
                            font: "Arial",
                        }),
                    ],
                }),

                new Paragraph({
                    alignment: AlignmentType.CENTER,
                    children: [
                        new TextRun({
                            text: nome,
                            size: 18,
                            bold: true,
                            font: "Arial",
                        }),
                        new TextRun({
                            text: " " + sobrenome,
                            size: 18,
                            bold: true,
                            font: "Arial",
                        }),
                    ],
                }),
            ],
        }],
    });

    // Tentar com opções diferentes de compatibilidade
    Packer.toBlob(doc).then((blob) => {
        saveAs(blob, "certificado.docx");
    });
}