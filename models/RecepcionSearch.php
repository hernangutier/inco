<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Recepcion;

/**
 * RecepcionSearch represents the model behind the search form of `app\models\Recepcion`.
 */
class RecepcionSearch extends Recepcion
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'id_prov', 'status','is_incidencia'], 'integer'],
            [['nfact', 'date_creation', 'date_recive', 'observaciones', 'is_incidencia'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Recepcion::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'id_prov' => $this->id_prov,
            'is_incidencia' => $this->is_incidencia,
            'date_creation' => $this->date_creation,
            'date_recive' => $this->date_recive,
            'status' => $this->status,
        ]);

        $query->andFilterWhere(['like', 'nfact', $this->nfact])
            ->andFilterWhere(['like', 'observaciones', $this->observaciones]);


        return $dataProvider;
    }
}
