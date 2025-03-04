enum TrashCan {
  papel,
  plastico,
  vidro,
  metal,
  madeira,
  pilhas,
  radiotivo,
  organico,
  nao_reciclavel,
}

class TrashItem {
  final String imageUrl;
  final TrashCan lixeira;
  const TrashItem({required this.imageUrl, required this.lixeira});
}

const imagesUrl = 'assets/images';

const trashCanImages = {
  TrashCan.papel: '$imagesUrl/lixeira_azul.png',
  TrashCan.plastico: '$imagesUrl/lixeira_vermelho.png',
  TrashCan.vidro: '$imagesUrl/lixeira_verde.png',
  TrashCan.metal: '$imagesUrl/lixeira_amarelo.png',
  TrashCan.madeira: '$imagesUrl/lixeira_preto.png',
  TrashCan.pilhas: '$imagesUrl/lixeira_laranja.png',
  TrashCan.radiotivo: '$imagesUrl/lixeira_roxo.png',
  TrashCan.organico: '$imagesUrl/lixeira_marrom.png',
  TrashCan.nao_reciclavel: '$imagesUrl/lixeira_cinza.png',
};

const trashItems = [
  TrashItem(imageUrl: '$imagesUrl/paper.png', lixeira: TrashCan.papel),
  TrashItem(imageUrl: '$imagesUrl/battery.png', lixeira: TrashCan.pilhas),
  TrashItem(imageUrl: '$imagesUrl/plastic.png', lixeira: TrashCan.plastico),
  TrashItem(
    imageUrl: '$imagesUrl/radioactive.png',
    lixeira: TrashCan.radiotivo,
  ),
  TrashItem(imageUrl: '$imagesUrl/glass.png', lixeira: TrashCan.vidro),
  TrashItem(imageUrl: '$imagesUrl/wood.png', lixeira: TrashCan.madeira),
  TrashItem(imageUrl: '$imagesUrl/metal.png', lixeira: TrashCan.metal),
  TrashItem(
    imageUrl: '$imagesUrl/non_recycle.png',
    lixeira: TrashCan.nao_reciclavel,
  ),
  TrashItem(imageUrl: '$imagesUrl/organic.png', lixeira: TrashCan.organico),
];
