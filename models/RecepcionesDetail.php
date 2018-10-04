<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "recepciones_detail".
 *
 * @property int $id
 * @property string $id_prod
 * @property int $cnt_facturada
 * @property int $cnt_recibida
 * @property int $id_recep
 *
 * @property Productos $prod
 * @property Recepcion $recep
 */
class RecepcionesDetail extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'recepciones_detail';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['cnt_facturada', 'cnt_recibida'], 'required'],
            [['cnt_facturada', 'cnt_recibida', 'id_recep'], 'integer'],
            [['id_prod'], 'string', 'max' => 45],
            [['id_prod'], 'exist', 'skipOnError' => true, 'targetClass' => Productos::className(), 'targetAttribute' => ['id_prod' => 'ref']],
            [['id_recep'], 'exist', 'skipOnError' => true, 'targetClass' => Recepcion::className(), 'targetAttribute' => ['id_recep' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'id_prod' => 'Id Prod',
            'cnt_facturada' => 'Cnt Facturada',
            'cnt_recibida' => 'Cnt Recibida',
            'id_recep' => 'Id Recep',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProd()
    {
        return $this->hasOne(Productos::className(), ['ref' => 'id_prod']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRecep()
    {
        return $this->hasOne(Recepcion::className(), ['id' => 'id_recep']);
    }
}
