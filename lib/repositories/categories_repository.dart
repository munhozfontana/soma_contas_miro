import '../models/category_context_entity.dart';
import '../models/category_entity.dart';

class CategoriesContextRepository {
  List<CategoryContextEntity> listAll() {
    return [
      CategoryContextEntity(
        name: 'Moradia',
        subCategories: [
          CategoryEntity(
            name: 'Aluguel / Prestação',
            keyWordsToFind: [
              'A C PINHEIRO CONSTRUCAO E ADMINISTRACAO LTDA',
            ],
          ),
          CategoryEntity(
            name: 'Dhama(parcela + condominio)',
            keyWordsToFind: [
              'EMPREENDIMENTOS IMOBILIARIOS DAMHA',
              'ASSOCIACAO RESIDENCIAL DAMHA II'
            ],
          ),
          CategoryEntity(
            name: 'Conta de luz',
            keyWordsToFind: [
              'NEOENERGIA',
            ],
          ),
          CategoryEntity(
            name: 'Conta de água',
            keyWordsToFind: [
              'CAESB',
              'COMPANHIA DE SANEAMENTO AMBIENTAL DO DISTRITO FEDERAL',
            ],
          ),
          CategoryEntity(
            name: 'Gás',
          ),
          CategoryEntity(
            name: 'IPTU',
          ),
          CategoryEntity(
            name: 'Internet',
          ),
          CategoryEntity(
            name: 'Telefone fixo',
          ),
          CategoryEntity(
              name: 'Telefone celular(todas as contas)',
              keyWordsToFind: [
                'CLARO',
                'PAGUEVELOZ IP LTDA',
              ]),
          CategoryEntity(
            name: 'Reparos na casa / apartamento',
            keyWordsToFind: [],
          ),
          CategoryEntity(
            name: 'Seguro Residencial',
          ),
          CategoryEntity(
            name: 'Alarme',
          ),
          CategoryEntity(
            name: 'Decoração / Casa',
            keyWordsToFind: ['Leroy Merlin'],
          ),
          CategoryEntity(
            name: 'Faxineira / diarista',
          ),
          CategoryEntity(
            name: 'Empregados',
          ),
          CategoryEntity(
            name: 'Serviços Periódicos',
          ),
        ],
      ),
      CategoryContextEntity(
        name: 'Alimentação',
        subCategories: [
          CategoryEntity(
            name: 'Supermercado',
            total: 0,
            keyWordsToFind: [
              'Eta',
              'Supermercado',
              'Atacadão',
              'Atacadao',
              'Atacadista',
              'Assai',
              'Carrefour',
              'Cristal Abc',
              'Ultrabox',
              'Assai Atacadista',
              'Pao de Acucar',
              'Pag*Emersonsilva',
              'Golfo Importacao Expor',
              'P. Acucar 308 309 Su',
              'Agência: 4222 Conta: 1288000000785650821-4',
            ],
          ),
          CategoryEntity(
            name: 'Restaurante',
            total: 0,
            keyWordsToFind: [
              'Kimmiso',
              'Burger King',
              'bk',
              'Kfc',
              'giraffas',
              'Subway',
              'Chiquinho',
              'Sushi Lovers Bsb',
              'Bk Burguer Shop Brasil',
              'Sandra Tomie Shinzato',
              'Acai Guara',
              'Burger King Shopping S',
              'Churrascaria',
              'Fries Burguer',
              'Brasilia Guara',
              'Mc Donalds - Arcos Dou',
              'Mcdonalds',
              'Don Mano',
              'Delicias Lanches',
              'P Pagamentos Ltda',
              'Sushi Lovers Bsb',
              'Frutos de Goias',
              'Morggana S Caldos Rest',
              'Meire Gontijo Cozinha',
              'Cozinha e Bar da Lu',
              'Cozinha',
              'Df Comercio de Sobreme',
              'Mv Presentes',
              'QUEDIMO VOGADO MILHOMENS',
              'Disk Bomba Lc',
              'Viva Paleteria K',
              'Tio Gordo Pj',
              'O Arabe do Brasil',
              'Pag*Comohamburgueria',
              'Ezymart Norte',
              'EZYMART SERVICOS E COMERCIO LTDA',
              'Perto e Pronto',
              'Pg *Ton Churitos',
              'Ppb*Nativas Prime',
              'Ana Cristina Reis da S',
            ],
          ),
          CategoryEntity(
            name: 'Delivery',
            total: 0,
            keyWordsToFind: [
              'ifood',
              'Ifd',
            ],
          ),
          CategoryEntity(
            name: 'Padaria',
            total: 0,
            keyWordsToFind: [
              'Padaria',
              'Paniville Paes e Deli',
              'Confeitaria Doce Chalé',
              'Agência: 1 Conta: 30997895-5',
              'Panificadora e Confeit',
            ],
          ),
        ],
      ),
      CategoryContextEntity(
        name: 'Transporte',
        subCategories: [
          CategoryEntity(
            name: 'Combustível',
            keyWordsToFind: [
              'Posto Pedra Bonita',
              'Auto Posto Cinco Estre',
              'Ancar Gestao de Empree',
              'Posto Via Estrutural',
            ],
          ),
          CategoryEntity(
            name: 'Manutenção do carro',
            keyWordsToFind: [
              'Florianomendesreg',
              'Ton Eduardo Sa T',
            ],
          ),
          CategoryEntity(
            name: 'Pedágio',
          ),
          CategoryEntity(
            name: 'Estacionamento',
            keyWordsToFind: [
              'Operandi Parking',
            ],
          ),
          CategoryEntity(
            name: 'IPVA/DPVAT',
          ),
          CategoryEntity(
            name: 'Aluguel / Prestação',
            keyWordsToFind: [
              'Pag*Marxcavalcantedos',
            ],
          ),
          CategoryEntity(
            name: 'Seguro do carro',
          ),
          CategoryEntity(
            name: 'Vale transporte',
            keyWordsToFind: [
              'Metro Estacao Guara',
            ],
          ),
          CategoryEntity(
            name: 'Táxi / Uber / 99',
            keyWordsToFind: [
              'Táxi',
              'Taxi',
              'Uber',
            ],
          ),
        ],
      ),
      CategoryContextEntity(
        name: 'Educação (sua e/ou dependentes)',
        subCategories: [
          CategoryEntity(
            name: 'Mensalidade',
            keyWordsToFind: [
              'DYNAMIC LINGUAGES',
              'Passei Direto',
              'CENTRO DE EDUCACAO SUPERIOR',
            ],
          ),
          CategoryEntity(
            name: 'Atividade Extra',
          ),
          CategoryEntity(
            name: 'Livros',
            keyWordsToFind: [
              'Times',
            ],
          ),
          CategoryEntity(
            name: 'Xerox',
          ),
          CategoryEntity(
            name: 'Papelaria',
          ),
          CategoryEntity(
            name: 'Uniforme',
          ),
          CategoryEntity(
            name: 'Equipamentos / Utensílios',
          ),
          CategoryEntity(
            name: 'Outros',
          ),
        ],
      ),
      CategoryContextEntity(
        name: 'Saúde & Beleza',
        subCategories: [
          CategoryEntity(
            name: 'Plano de saúde',
            keyWordsToFind: [
              'Amil',
              'BIANCA CHRISTINE DA SILVA SOARES',
            ],
          ),
          CategoryEntity(
            name: 'Médicos / Dentistas / Fisioterapeuta ',
          ),
          CategoryEntity(
            name: 'Maquiagem / Perfumaria',
            keyWordsToFind: [
              'Ccs - Santa Paula',
              'Clinica de Imagem Sam',
              'Evo*Clinica O',
              'Pag*Makeup',
            ],
          ),
          CategoryEntity(
            name: 'Salão de beleza / barbearia',
          ),
          CategoryEntity(name: 'Farmácia', keyWordsToFind: [
            'Drogasil',
            'Drogaria',
            'Atmdrog Medvip Qe',
            'Cosmeticos',
          ]),
        ],
      ),
      CategoryContextEntity(
        name: 'Lazer',
        subCategories: [
          CategoryEntity(
            name: 'Academia',
            keyWordsToFind: [
              'Bluefit',
              'Sua Academia',
            ],
          ),
          CategoryEntity(
            name: 'Clube',
            keyWordsToFind: [],
          ),
          CategoryEntity(
            name: 'Sócio Torcedor',
            keyWordsToFind: [
              'Pag*Karlaalessandrafe',
            ],
          ),
          CategoryEntity(
            name: 'Parks / Clubs / Festas',
            keyWordsToFind: [
              'Na Venda Uk Brasil',
              'Aguas Correntes Park',
              'Club Aguas Correntes',
            ],
          ),
          CategoryEntity(
            name: 'Assinaturas/Serviços',
            keyWordsToFind: [
              'Apple.Com/Bill',
              'Google Storage',
              'Google Disney Mobile',
              'Dl*Google Disney',
              'Amazonprimebr',
              'Amazon.Com.Br',
              'Amazon Prime Canais',
            ],
          ),
          CategoryEntity(
            name: 'Cinema',
            keyWordsToFind: [
              'Ingresso.Com',
            ],
          ),
          CategoryEntity(
            name: 'Lojas virtuais',
            keyWordsToFind: [
              'amazon-marketplace',
              'Amazon.Com.Br Digital',
              'Mercpago *Buzina',
              'Shein',
            ],
          ),
          CategoryEntity(
            name: 'Shopping',
            keyWordsToFind: [
              'Lojas Americanas',
              'Shop',
              'Shopping',
              'Plush Toy',
              'Park Shopping',
              'Mikami Produtos Japon',
              'Daiso Brasilia',
              '35369782-4',
              'No Limite Presentes',
            ],
          ),
        ],
      ),
      CategoryContextEntity(
        name: 'Vestuário',
        subCategories: [
          CategoryEntity(
            name: 'Roupas',
            keyWordsToFind: [
              'Lojas Renner Fl',
              'V Visual',
              'REALIZE CREDITO FINANCIAMENTO E INVESTIM',
            ],
          ),
          CategoryEntity(
            name: 'Calçados',
          ),
          CategoryEntity(
            name: 'Acessórios',
            keyWordsToFind: [
              'Pag*Realacessorios',
            ],
          ),
        ],
      ),
      CategoryContextEntity(
        name: 'Outros gastos',
        subCategories: [
          CategoryEntity(name: 'Eletrodomésticos / moveis', keyWordsToFind: [
            'Casasbahia',
          ]),
          CategoryEntity(
            name: 'Eletrônicos',
            keyWordsToFind: [
              'Eletronica Silva',
              'Ec*Pichaump',
              'PICHAU',
              'Kabum',
              'Eduardo Inacio da Sil',
            ],
          ),
          CategoryEntity(
            name: 'Imposto de Renda',
          ),
          CategoryEntity(
            name: 'Seguros de vida',
          ),
          CategoryEntity(
            name: 'PJ',
            keyWordsToFind: [
              'IUGU SERVICOS NA INTERNET',
              'DAS - Simples Nacional',
              'DARF',
              'S. MONTEIRO CONTABILIDADE LTDA - ME por Banco BS2',
              'S MONTEIRO CONTABILIDADE LTDA ME',
            ],
          ),
          CategoryEntity(
            name: 'Sindicato',
          ),
          CategoryEntity(
            name: 'INSS',
          ),
          CategoryEntity(
            name: 'Previdência Privada',
          ),
          CategoryEntity(
            name: 'Presentes',
            keyWordsToFind: [
              'Carters',
            ],
          ),
          CategoryEntity(
            name: 'Doações',
          ),
        ],
      ),
      CategoryContextEntity(
        name: 'Pet',
        subCategories: [
          CategoryEntity(
            name: 'Ração / areia',
            keyWordsToFind: [
              'Petz',
            ],
          ),
          CategoryEntity(
            name: 'Pet shop',
          ),
          CategoryEntity(
            name: 'Veterinária',
          ),
        ],
      ),
      CategoryContextEntity(
        name: 'Diversos',
        subCategories: [
          CategoryEntity(
            name: 'Serviços esporádicos',
            keyWordsToFind: [
              'Adriano de Mattos Sil',
            ],
          ),
          CategoryEntity(
            name: 'Demais gastos',
            keyWordsToFind: [
              'Xeirinhos Com',
              'Wesley Calixto Gomes da Silva',
              'Agência: 3189 Conta: 2008271-1',
            ],
          ),
          CategoryEntity(
            name: 'Gastos desconhecidos',
            keyWordsToFind: [
              'Francisco da Chaga de',
              'Pag*Dommusfundode',
              'Undergroundha',
              'Pag*Antoniademaria',
              'Pag*Edivaldodesousasi',
              'Digital Doc',
              'INSTITUTO EURO AMERICANO DE EDUCACAO CIE',
              'Eronildes da Costa Ve',
              'Enar Entretenimento',
              'Pague Menos',
              'Pag*Sejacomercial',
              '7 - Sia',
              'Pag*Josedariolimada',
              'Pag*Sjcomerciale',
              '27049239-9',
              'P.M. DE CIDADE OCIDENTAL',
              'Motiva Imoveis',
            ],
          ),
          CategoryEntity(
            name: 'Serviços bancários/taxas de investimentos',
            keyWordsToFind: [
              'Resgate de crédito pessoal',
              'Juros de atraso de pagamento de pix',
              'Juros de atraso de saque',
            ],
          ),
          CategoryEntity(
            name: 'Cartões a cancelar',
            keyWordsToFind: [
              'Saldo em atraso',
              'IOF de atraso',
              'Multa de atraso',
              '841803-9',
              '6847829495-1',
              '28431-9',
              '982792-7',
              '19855477-6'
            ],
          ),
          CategoryEntity(
            name: 'Multa/TAXAS',
            keyWordsToFind: [
              'DETRAN',
              '1273411102-0',
            ],
          ),
          CategoryEntity(
            name: 'Outros',
            keyWordsToFind: [
              'Pag*Antoniomagno',
              'Pag*Ceopag',
              'LUCAS RUAN FRANCA COSTA',
              '353114192-0',
              'Luis Eduardo De Oliveira Freitas',
              'Valderice França Batista',
              'Valderice Franca Batista',
              'Lucas Ruan França Costa',
            ],
          ),
        ],
      ),
    ];
  }
}
