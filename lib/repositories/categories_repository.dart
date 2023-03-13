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
          ),
          CategoryEntity(
            name: 'Dhama(parcela + condominio)',
          ),
          CategoryEntity(
            name: 'Conta de luz',
          ),
          CategoryEntity(
            name: 'Conta de água',
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
          ),
          CategoryEntity(
            name: 'Reparos na casa / apartamento',
          ),
          CategoryEntity(
            name: 'Seguro Residencial',
          ),
          CategoryEntity(
            name: 'Alarme',
          ),
          CategoryEntity(
              name: 'Decoração / Casa', keyWordsToFind: ['Leroy Merlin']),
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
            ],
          ),
          CategoryEntity(
            name: 'Manutenção do carro',
            keyWordsToFind: [
              'Florianomendesreg',
            ],
          ),
          CategoryEntity(
            name: 'Pedágio',
          ),
          CategoryEntity(
            name: 'Estacionamento',
          ),
          CategoryEntity(
            name: 'IPVA/DPVAT',
          ),
          CategoryEntity(
            name: 'Aluguel / Prestação',
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
              'Passei Direto',
            ],
          ),
          CategoryEntity(
            name: 'Atividade Extra',
          ),
          CategoryEntity(name: 'Livros', keyWordsToFind: [
            'Times',
          ]),
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
          CategoryEntity(name: 'Plano de saúde', keyWordsToFind: [
            'Amil',
          ]),
          CategoryEntity(
            name: 'Médicos / Dentistas / Fisioterapeuta ',
          ),
          CategoryEntity(
            name: 'Maquiagem / Perfumaria',
            keyWordsToFind: [
              'Ccs - Santa Paula',
              'Clinica de Imagem Sam',
              'Evo*Clinica O',
            ],
          ),
          CategoryEntity(
            name: 'Salão de beleza / barbearia',
          ),
          CategoryEntity(name: 'Farmácia', keyWordsToFind: [
            'Drogasil',
            'Drogaria',
            'Atmdrog Medvip Qe',
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
            ],
          ),
          CategoryEntity(
            name: 'Clube',
          ),
          CategoryEntity(
            name: 'Sócio Torcedor',
            keyWordsToFind: ['Pag*Karlaalessandrafe'],
          ),
          CategoryEntity(
            name: 'Parks / Clubs / Festas',
          ),
          CategoryEntity(
            name: 'Assinaturas/Serviços',
            keyWordsToFind: [
              'Google Storage',
              'Google Disney Mobile',
              'Dl*Google Disney',
              'Amazonprimebr',
              'Amazon.Com.Br'
            ],
          ),
          CategoryEntity(
            name: 'Cinema',
          ),
          CategoryEntity(
            name: 'Lojas virtuais',
            keyWordsToFind: [
              'amazon-marketplace',
              'Amazon.Com.Br Digital',
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
            ],
          ),
          CategoryEntity(
            name: 'Calçados',
          ),
          CategoryEntity(
            name: 'Acessórios',
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
          ),
          CategoryEntity(
            name: 'Imposto de Renda',
          ),
          CategoryEntity(
            name: 'Seguros de vida',
          ),
          CategoryEntity(
            name: 'PJ',
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
          ),
          CategoryEntity(
            name: 'Demais gastos',
          ),
          CategoryEntity(
            name: 'Gastos desconhecidos',
            keyWordsToFind: [
              "Francisco da Chaga de",
              "Pag*Edivaldodesousasi",
              "Undergroundha",
              "Pag*Edivaldodesousasi",
              "Digital Doc",
              "INSTITUTO EURO AMERICANO DE EDUCACAO CIE",
              "Eronildes da Costa Ve",
              "Enar Entretenimento",
              "Pague Menos",
              "Pag*Sejacomercial",
            ],
          ),
          CategoryEntity(
            name: 'Serviços bancários/taxas de investimentos',
          ),
          CategoryEntity(name: 'Cartões a cancelar', keyWordsToFind: [
            "Saldo em atraso",
            "IOF de atraso",
            "Multa de atraso",
          ]),
          CategoryEntity(
            name: 'Multa/TAXAS',
          ),
          CategoryEntity(
            name: 'Outros',
            keyWordsToFind: [
              'Pag*Antoniomagno',
              'Pag*Ceopag',
              'LUCAS RUAN FRANCA COSTA',
            ],
          ),
        ],
      ),
    ];
  }
}
