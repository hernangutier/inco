<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\RecepcionesDetail;

/**
 * RecepcionesDetailSearch represents the model behind the search form of `app\models\RecepcionesDetail`.
 */
class RecepcionesDetailSearch extends RecepcionesDetail
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'cnt_facturada', 'cnt_recibida', 'id_recep'], 'integer'],
            [['id_prod'], 'safe'],
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
        $query = RecepcionesDetail::find();

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
            'cnt_facturada' => $this->cnt_facturada,
            'cnt_recibida' => $this->cnt_recibida,
            'id_recep' => $this->id_recep,
        ]);

        $query->andFilterWhere(['like', 'id_prod', $this->id_prod]);

        return $dataProvider;
    }
}
