<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "lotes".
 *
 * @property int $id
 * @property int $id_recep
 * @property int $id_prod
 * @property int $cnt_empaque
 */
class Lotes extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'lotes';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_recep', 'id_prod'], 'required'],
            [['id_recep', 'id_prod', 'cnt_empaque'], 'integer'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_recep' => 'Id Recep',
            'id_prod' => 'Id Prod',
            'cnt_empaque' => 'Cnt Empaque',
        ];
    }
}
