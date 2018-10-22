<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "vw_clientes".
 *
 * @property int $id
 * @property string $tostring
 * @property string $cedrif
 * @property string $razon
 */
class VwClientes extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'vw_clientes';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id'], 'integer'],
            [['tostring'], 'string', 'max' => 221],
            [['cedrif'], 'string', 'max' => 20],
            [['razon'], 'string', 'max' => 200],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'tostring' => 'Tostring',
            'cedrif' => 'Cedrif',
            'razon' => 'Razon',
        ];
    }
}
