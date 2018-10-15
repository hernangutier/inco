<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "notas_entrega_detail".
 *
 * @property int $id
 * @property int $id_not
 * @property int $id_prod
 * @property int $cnt
 *
 * @property NotasEntrega $not
 * @property Productos $prod
 */
class NotasEntregaDetail extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'notas_entrega_detail';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_not', 'id_prod', 'cnt'], 'required'],
            [['id_not', 'id_prod', 'cnt'], 'integer'],
            [['id_not'], 'exist', 'skipOnError' => true, 'targetClass' => NotasEntrega::className(), 'targetAttribute' => ['id_not' => 'id']],
            [['id_prod'], 'exist', 'skipOnError' => true, 'targetClass' => Productos::className(), 'targetAttribute' => ['id_prod' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_not' => 'Id Not',
            'id_prod' => 'Id Prod',
            'cnt' => 'Cnt',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getNot()
    {
        return $this->hasOne(NotasEntrega::className(), ['id' => 'id_not']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProd()
    {
        return $this->hasOne(Productos::className(), ['id' => 'id_prod']);
    }
}
