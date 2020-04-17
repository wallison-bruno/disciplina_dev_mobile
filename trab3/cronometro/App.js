import React, {Component} from 'react';
import {
  SafeAreaView,
  StyleSheet,
  ScrollView,
  View,
  Text,
  StatusBar,
  TouchableOpacity,
} from 'react-native';

import {
  Header,
  LearnMoreLinks,
  Colors,
  DebugInstructions,
  ReloadInstructions,
} from 'react-native/Libraries/NewAppScreen';

class cronometro extends Component {
  constructor(props) {
    super(props);
    this.state = {
      tempo: null,
      numero: 0,
      startParaTexto: 'Start',
    };

    this.startParaBotao = this.startParaBotao.bind(this);
    this.zerarBotao = this.zerarBotao.bind(this);
  }

  startParaBotao() {
    if (this.state.tempo == null) {
      let novoEs = this.state;
      novoEs.startParaTexto = 'Parar';
      this.setState(novoEs);

      this.state.tempo = setInterval(() => {
        let novoEstado = this.state;
        novoEstado.numero += 0.1;
        this.setState(novoEstado);
      }, 100);
    } else {
      clearInterval(this.state.tempo);
      this.state.tempo = null;
      let novoEstado = this.state;
      novoEstado.startParaTexto = 'Start';
      this.setState(novoEstado);
    }
  }

  zerarBotao() {
    clearInterval(this.state.tempo);
    let novoEstado = this.state;
    novoEstado.startParaTexto = ' Start';
    novoEstado.timer = null;
    novoEstado.numero = 0;
    this.setState(novoEstado);
  }

  render() {
    return (
      <View style={styles.body}>
        <View style={styles.tempoConteiner}>
          <Text style={styles.textoTitulo}>CRONÔMETRO</Text>
        </View>
        <View style={styles.tempoConteiner}>
          <Text style={styles.textoTempo}>{this.state.numero.toFixed(1)}</Text>
          <View style={styles.botaoContainer}>
            <TouchableOpacity
              style={styles.botao}
              onPress={this.startParaBotao}>
              <Text style={styles.botaoTexto}>{this.state.startParaTexto}</Text>
            </TouchableOpacity>
            <TouchableOpacity style={styles.botao} onPress={this.zerarBotao}>
              <Text style={styles.botaoTexto}>Zera</Text>
            </TouchableOpacity>
          </View>
        </View>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  body: {
    flex: 1,
    backgroundColor: 'yellow',
    justifyContent: 'center',
  },
  textoTitulo: {
    justifyContent: 'center',
    alignItems: 'center',
    fontSize: 20,
  },
  tempoConteiner: {
    justifyContent: 'center',
    alignItems: 'center',
  },
  textoTempo: {
    fontSize: 40,
    fontWeight: 'bold',
  },
  botaoContainer: {
    flexDirection: 'row',
    padding: 20,
  },
  botao: {
    backgroundColor: 'gray',
    marginHorizontal: 15,
    height: 40,
    justifyContent: 'center',
    width: 75,
    alignItems: 'center',
    borderRadius: 10,
  },
  botaoTexto: {
    color: '#FFF',
  },
});

export default cronometro;
