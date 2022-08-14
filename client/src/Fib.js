import React, { Component } from "react";
import axios from 'axios';

class Fib extends Component {
    state = {
        seenIndexes: [],
        values: {},
        index: ''
    }

    componentDidMount() {
        this.fetchValues();
        this.fetchIndexes();
    }

    async fetchValues() {
        const values = await axios.get('/api/values/current');
        this.setState({values: values.data});
    }

    async fetchIndexes() {
        const seenIndexes = await axios.get('/api/values/all');
        this.setState({seenIndexes: seenIndexes.data});
    }

    handleSubmit = async (event) => {
        event.preventDefault();

        await axios.post('/api/values',{
            index: this.state.index
        });
        this.setState({ index: '' });
    };

    renderSeenIndex() {
        return this.state.seenIndexes.map(({ number }) => number).join (', ');
    }

    renderValues() {
        const entries = [];

        for (let key in this.state.values) {
            entries.push(
                <div key={key}>
                    Fibonacci({key}) = {this.state.values[{key}]}
                </div>
            );
        }
        return this.state.values;
    }

    render() {
        return (
            <div>
                <form onSubmit={this.handleSubmit}>
                    <label> Enter your index:
                        <input value={this.state.index}
                        onChange={event => this.setState({index: event.target.value})}
                        />
                        <button>Submit</button>
                    </label>
                </form>

                <h3>Indexes seen:</h3>
                {this.renderSeenIndexes()}

                <h3>Calculated values:</h3>
                {this.renderValues()}
            </div>
        )
    }
};

export default Fib;